#include <ros/ros.h>
#include <ros/package.h>

#include <XnOpenNI.h>
#include <XnCppWrapper.h>

#include <iostream>

#include "waving_detection/HandCreate.h"
#include "waving_detection/HandDestroy.h"
#include "waving_detection/HandUpdate.h"

#define CHECK_RC(nRetVal, what)\
	if (nRetVal != XN_STATUS_OK) {\
		ROS_ERROR("%s failed: %s", what, xnGetStatusString(nRetVal));\
		return nRetVal;\
	}

    /* Avaible hand gestures:
		Wave
		Click
		RaiseHand
		MovingHand
     */
#define GESTURE_WAVE "Wave"
#define GESTURE_RAISE "RaiseHand"
#define GESTURE_MOVE "MovingHand"


// OpenNI Objects
xn::Context g_Context;
xn::GestureGenerator g_GestureGenerator;
xn::HandsGenerator g_HandsGenerator;
XnBoundingBox3D* b_XnBoundingBox3D;

ros::Publisher pubHandCreate;
ros::Publisher pubHandUpdate;
ros::Publisher pubHandDestroy;

void XN_CALLBACK_TYPE GestureRecognizedHandler(
        xn::GestureGenerator &generator,
        const XnChar *strGesture,
        const XnPoint3D *pPosition,
        const XnPoint3D *pEndPosition,
        void *pCookie) {
	//printf("Gesture recognized: %s\n", strGesture);
    // disable wave detection
    g_GestureGenerator.RemoveGesture(strGesture);
    // start tracking
    g_HandsGenerator.StartTracking(*pEndPosition);
}



void XN_CALLBACK_TYPE Hand_Create(
        xn::HandsGenerator &generator,
        XnUserID userID,
        const XnPoint3D *xnPos,
        XnFloat time,
        void *pCookie) {
    std::cout << "waving detected" << std::endl;
    waving_detection::HandCreate message;
    message.header.stamp = ros::Time::now();
    message.id = userID;
    message.point.x = xnPos->X;
    message.point.y = xnPos->Y;
    message.point.z = xnPos->Z;
    pubHandCreate.publish(message);
}

void XN_CALLBACK_TYPE Hand_Update(
        xn::HandsGenerator &generator,
        XnUserID userID,
        const XnPoint3D *xnPos,
        XnFloat time,
        void *pCookie) {
    waving_detection::HandUpdate message;
    message.header.stamp = ros::Time::now();
    message.id = userID;
    message.point.x = xnPos->X;
    message.point.y = xnPos->Y;
    message.point.z = xnPos->Z;
    pubHandUpdate.publish(message);
}

void XN_CALLBACK_TYPE Hand_Destroy(
        xn::HandsGenerator &generator,
        XnUserID userID,
        XnFloat time,
        void *pCookie) {
    // enable wave detection
    g_GestureGenerator.AddGesture(GESTURE_WAVE, b_XnBoundingBox3D);
   // g_GestureGenerator.AddGesture(GESTURE_RAISE, b_XnBoundingBox3D);
   // g_GestureGenerator.AddGesture(GESTURE_MOVE, b_XnBoundingBox3D);
    
    waving_detection::HandDestroy message;
    message.header.stamp = ros::Time::now();
    message.id = userID;
    pubHandDestroy.publish(message);
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "wave_detection");
    ros::NodeHandle node;

    // Read config xml
    std::string configFilename = ros::package::getPath("wave_detection") + "/gesture_wave_tracker.xml";

    // Initialize context object
    xn::ScriptNode scriptNode;
    g_Context.InitFromXmlFile(configFilename.c_str(), scriptNode);
    XnStatus rc = g_Context.Init();
    CHECK_RC(rc, "Initalize context");

    rc = g_GestureGenerator.Create(g_Context);
    CHECK_RC(rc, "Initalize gesture generator");

    rc = g_HandsGenerator.Create(g_Context);
    CHECK_RC(rc, "Initalize hands generator");

    // Register callbacks
    XnCallbackHandle h1, h2;
    g_GestureGenerator.RegisterGestureCallbacks(GestureRecognizedHandler, NULL, NULL, h1);
    g_HandsGenerator.RegisterHandCallbacks(Hand_Create, Hand_Update, Hand_Destroy, NULL, h2);

    // Initialization done. Start generating
    rc = g_Context.StartGeneratingAll();
    CHECK_RC(rc, "Start generating");

    // more gestures: Click, RaiseHand ?
    rc = g_GestureGenerator.AddGesture(GESTURE_WAVE, b_XnBoundingBox3D);
   // rc = g_GestureGenerator.AddGesture(GESTURE_RAISE, b_XnBoundingBox3D);
  // rc = g_GestureGenerator.AddGesture(GESTURE_MOVE, b_XnBoundingBox3D);

    // Create publisher
    pubHandCreate = node.advertise<waving_detection::HandCreate>("HandCreate", 1000);
    pubHandUpdate = node.advertise<waving_detection::HandUpdate>("HandUpdate", 1000);
    pubHandDestroy = node.advertise<waving_detection::HandDestroy>("HandDestroy", 1000);
    
    // async spinner for gesture detection and parallel service advertising
    ros::AsyncSpinner spinner(2); // Use 2 threads
    spinner.start();

    ROS_INFO("ToBI wave detection is running ... ");

    while (node.ok()) {
        rc = g_Context.WaitAndUpdateAll();
        CHECK_RC(rc, "Wait and update all");
    }

    // Cleanup
    g_Context.Release();

    return 0;
}
