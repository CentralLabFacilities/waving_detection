cmake_minimum_required(VERSION 2.4.6)
cmake_policy(SET CMP0003 NEW)
cmake_policy(SET CMP0005 NEW)

## Setup catkin
project(wave_detection)
find_package(catkin REQUIRED COMPONENTS message_generation 
                                        std_msgs 
                                        geometry_msgs 
                                        roscpp 
                                        roslib)
add_message_files(FILES HandCreate.msg HandDestroy.msg HandUpdate.msg)
generate_messages(DEPENDENCIES std_msgs geometry_msgs)
catkin_package(CATKIN_DEPENDS message_runtime std_msgs geometry_msgs roscpp)

## Include catkin deps
include_directories(include ${catkin_INCLUDE_DIRS})

## Find OpenNI
include(FindPkgConfig)
pkg_check_modules(OPENNI REQUIRED libopenni)
MESSAGE(STATUS "  openni lib: ${OPENNI_LIBRARIES} -- dir: ${OPENNI_LIBRARY_DIRS}")
include_directories(${OPENNI_INCLUDE_DIRS})
link_directories(${OPENNI_LIBRARY_DIRS})

add_executable(wave_tracker src/wave_tracker.cpp)
target_link_libraries(wave_tracker ${OPENNI_LIBRARIES} ${catkin_LIBRARIES})

install(TARGETS wave_tracker
   ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
   LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
   RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(FILES wave_tracker.launch
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)
