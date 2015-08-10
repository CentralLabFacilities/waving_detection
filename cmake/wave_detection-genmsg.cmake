# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "wave_detection: 3 messages, 0 services")

set(MSG_I_FLAGS "-Iwave_detection:/home/biron/armserver/src/robocup-ros/wave_detection/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(wave_detection_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandCreate.msg" NAME_WE)
add_custom_target(_wave_detection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wave_detection" "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandCreate.msg" "std_msgs/Header:geometry_msgs/Point"
)

get_filename_component(_filename "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandUpdate.msg" NAME_WE)
add_custom_target(_wave_detection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wave_detection" "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandUpdate.msg" "std_msgs/Header:geometry_msgs/Point"
)

get_filename_component(_filename "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandDestroy.msg" NAME_WE)
add_custom_target(_wave_detection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wave_detection" "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandDestroy.msg" "std_msgs/Header"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(wave_detection
  "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandCreate.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wave_detection
)
_generate_msg_cpp(wave_detection
  "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandUpdate.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wave_detection
)
_generate_msg_cpp(wave_detection
  "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandDestroy.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wave_detection
)

### Generating Services

### Generating Module File
_generate_module_cpp(wave_detection
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wave_detection
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(wave_detection_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(wave_detection_generate_messages wave_detection_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandCreate.msg" NAME_WE)
add_dependencies(wave_detection_generate_messages_cpp _wave_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandUpdate.msg" NAME_WE)
add_dependencies(wave_detection_generate_messages_cpp _wave_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandDestroy.msg" NAME_WE)
add_dependencies(wave_detection_generate_messages_cpp _wave_detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wave_detection_gencpp)
add_dependencies(wave_detection_gencpp wave_detection_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wave_detection_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(wave_detection
  "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandCreate.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wave_detection
)
_generate_msg_lisp(wave_detection
  "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandUpdate.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wave_detection
)
_generate_msg_lisp(wave_detection
  "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandDestroy.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wave_detection
)

### Generating Services

### Generating Module File
_generate_module_lisp(wave_detection
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wave_detection
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(wave_detection_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(wave_detection_generate_messages wave_detection_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandCreate.msg" NAME_WE)
add_dependencies(wave_detection_generate_messages_lisp _wave_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandUpdate.msg" NAME_WE)
add_dependencies(wave_detection_generate_messages_lisp _wave_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandDestroy.msg" NAME_WE)
add_dependencies(wave_detection_generate_messages_lisp _wave_detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wave_detection_genlisp)
add_dependencies(wave_detection_genlisp wave_detection_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wave_detection_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(wave_detection
  "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandCreate.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wave_detection
)
_generate_msg_py(wave_detection
  "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandUpdate.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wave_detection
)
_generate_msg_py(wave_detection
  "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandDestroy.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wave_detection
)

### Generating Services

### Generating Module File
_generate_module_py(wave_detection
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wave_detection
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(wave_detection_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(wave_detection_generate_messages wave_detection_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandCreate.msg" NAME_WE)
add_dependencies(wave_detection_generate_messages_py _wave_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandUpdate.msg" NAME_WE)
add_dependencies(wave_detection_generate_messages_py _wave_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/biron/armserver/src/robocup-ros/wave_detection/msg/HandDestroy.msg" NAME_WE)
add_dependencies(wave_detection_generate_messages_py _wave_detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wave_detection_genpy)
add_dependencies(wave_detection_genpy wave_detection_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wave_detection_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wave_detection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wave_detection
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(wave_detection_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(wave_detection_generate_messages_cpp geometry_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wave_detection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wave_detection
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(wave_detection_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(wave_detection_generate_messages_lisp geometry_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wave_detection)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wave_detection\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wave_detection
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(wave_detection_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(wave_detection_generate_messages_py geometry_msgs_generate_messages_py)
