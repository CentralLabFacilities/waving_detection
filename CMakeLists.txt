cmake_minimum_required(VERSION 2.4.6)
cmake_policy(SET CMP0003 NEW)
cmake_policy(SET CMP0005 NEW)

## Setup catkin
project(waving_detection)
find_package(catkin REQUIRED COMPONENTS message_generation 
                                        std_msgs 
                                        geometry_msgs 
                                        roscpp 
                                        roslib)
add_message_files(FILES HandCreate.msg HandDestroy.msg HandUpdate.msg)
generate_messages(DEPENDENCIES std_msgs geometry_msgs)
catkin_package(CATKIN_DEPENDS message_runtime std_msgs geometry_msgs roscpp)

## Include catkin deps
include_directories(include devel/include ${catkin_INCLUDE_DIRS} )

## Ensure that messages are automatically build when invoking "make". This is
## only relevant when using plain cmake instead of catkin
add_custom_target(generate_messages ALL)
add_dependencies(generate_messages waving_detection_generate_messages)

## Find OpenNI
include(FindPkgConfig)
pkg_check_modules(OPENNI REQUIRED libopenni)
MESSAGE(STATUS "  openni lib: ${OPENNI_LIBRARIES} -- dir: ${OPENNI_LIBRARY_DIRS}")
include_directories(${OPENNI_INCLUDE_DIRS})
link_directories(${OPENNI_LIBRARY_DIRS})

add_executable(waving_detection src/waving_detection.cpp)
target_link_libraries(waving_detection ${OPENNI_LIBRARIES} ${catkin_LIBRARIES})

install(TARGETS waving_detection
   ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
   LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
   RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(DIRECTORY launch
    DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})

install(DIRECTORY config
    DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})
    