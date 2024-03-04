# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "weed_killing: 2 messages, 1 services")

set(MSG_I_FLAGS "-Iweed_killing:/home/lmk/weed_killing/src/weed_killing/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(weed_killing_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/lmk/weed_killing/src/weed_killing/msg/SetServoAngle.msg" NAME_WE)
add_custom_target(_weed_killing_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "weed_killing" "/home/lmk/weed_killing/src/weed_killing/msg/SetServoAngle.msg" ""
)

get_filename_component(_filename "/home/lmk/weed_killing/src/weed_killing/msg/SetServoDamping.msg" NAME_WE)
add_custom_target(_weed_killing_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "weed_killing" "/home/lmk/weed_killing/src/weed_killing/msg/SetServoDamping.msg" ""
)

get_filename_component(_filename "/home/lmk/weed_killing/src/weed_killing/srv/QueryServoAngle.srv" NAME_WE)
add_custom_target(_weed_killing_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "weed_killing" "/home/lmk/weed_killing/src/weed_killing/srv/QueryServoAngle.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(weed_killing
  "/home/lmk/weed_killing/src/weed_killing/msg/SetServoAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/weed_killing
)
_generate_msg_cpp(weed_killing
  "/home/lmk/weed_killing/src/weed_killing/msg/SetServoDamping.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/weed_killing
)

### Generating Services
_generate_srv_cpp(weed_killing
  "/home/lmk/weed_killing/src/weed_killing/srv/QueryServoAngle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/weed_killing
)

### Generating Module File
_generate_module_cpp(weed_killing
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/weed_killing
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(weed_killing_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(weed_killing_generate_messages weed_killing_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lmk/weed_killing/src/weed_killing/msg/SetServoAngle.msg" NAME_WE)
add_dependencies(weed_killing_generate_messages_cpp _weed_killing_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lmk/weed_killing/src/weed_killing/msg/SetServoDamping.msg" NAME_WE)
add_dependencies(weed_killing_generate_messages_cpp _weed_killing_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lmk/weed_killing/src/weed_killing/srv/QueryServoAngle.srv" NAME_WE)
add_dependencies(weed_killing_generate_messages_cpp _weed_killing_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(weed_killing_gencpp)
add_dependencies(weed_killing_gencpp weed_killing_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS weed_killing_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(weed_killing
  "/home/lmk/weed_killing/src/weed_killing/msg/SetServoAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/weed_killing
)
_generate_msg_eus(weed_killing
  "/home/lmk/weed_killing/src/weed_killing/msg/SetServoDamping.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/weed_killing
)

### Generating Services
_generate_srv_eus(weed_killing
  "/home/lmk/weed_killing/src/weed_killing/srv/QueryServoAngle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/weed_killing
)

### Generating Module File
_generate_module_eus(weed_killing
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/weed_killing
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(weed_killing_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(weed_killing_generate_messages weed_killing_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lmk/weed_killing/src/weed_killing/msg/SetServoAngle.msg" NAME_WE)
add_dependencies(weed_killing_generate_messages_eus _weed_killing_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lmk/weed_killing/src/weed_killing/msg/SetServoDamping.msg" NAME_WE)
add_dependencies(weed_killing_generate_messages_eus _weed_killing_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lmk/weed_killing/src/weed_killing/srv/QueryServoAngle.srv" NAME_WE)
add_dependencies(weed_killing_generate_messages_eus _weed_killing_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(weed_killing_geneus)
add_dependencies(weed_killing_geneus weed_killing_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS weed_killing_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(weed_killing
  "/home/lmk/weed_killing/src/weed_killing/msg/SetServoAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/weed_killing
)
_generate_msg_lisp(weed_killing
  "/home/lmk/weed_killing/src/weed_killing/msg/SetServoDamping.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/weed_killing
)

### Generating Services
_generate_srv_lisp(weed_killing
  "/home/lmk/weed_killing/src/weed_killing/srv/QueryServoAngle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/weed_killing
)

### Generating Module File
_generate_module_lisp(weed_killing
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/weed_killing
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(weed_killing_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(weed_killing_generate_messages weed_killing_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lmk/weed_killing/src/weed_killing/msg/SetServoAngle.msg" NAME_WE)
add_dependencies(weed_killing_generate_messages_lisp _weed_killing_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lmk/weed_killing/src/weed_killing/msg/SetServoDamping.msg" NAME_WE)
add_dependencies(weed_killing_generate_messages_lisp _weed_killing_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lmk/weed_killing/src/weed_killing/srv/QueryServoAngle.srv" NAME_WE)
add_dependencies(weed_killing_generate_messages_lisp _weed_killing_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(weed_killing_genlisp)
add_dependencies(weed_killing_genlisp weed_killing_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS weed_killing_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(weed_killing
  "/home/lmk/weed_killing/src/weed_killing/msg/SetServoAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/weed_killing
)
_generate_msg_nodejs(weed_killing
  "/home/lmk/weed_killing/src/weed_killing/msg/SetServoDamping.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/weed_killing
)

### Generating Services
_generate_srv_nodejs(weed_killing
  "/home/lmk/weed_killing/src/weed_killing/srv/QueryServoAngle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/weed_killing
)

### Generating Module File
_generate_module_nodejs(weed_killing
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/weed_killing
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(weed_killing_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(weed_killing_generate_messages weed_killing_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lmk/weed_killing/src/weed_killing/msg/SetServoAngle.msg" NAME_WE)
add_dependencies(weed_killing_generate_messages_nodejs _weed_killing_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lmk/weed_killing/src/weed_killing/msg/SetServoDamping.msg" NAME_WE)
add_dependencies(weed_killing_generate_messages_nodejs _weed_killing_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lmk/weed_killing/src/weed_killing/srv/QueryServoAngle.srv" NAME_WE)
add_dependencies(weed_killing_generate_messages_nodejs _weed_killing_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(weed_killing_gennodejs)
add_dependencies(weed_killing_gennodejs weed_killing_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS weed_killing_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(weed_killing
  "/home/lmk/weed_killing/src/weed_killing/msg/SetServoAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/weed_killing
)
_generate_msg_py(weed_killing
  "/home/lmk/weed_killing/src/weed_killing/msg/SetServoDamping.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/weed_killing
)

### Generating Services
_generate_srv_py(weed_killing
  "/home/lmk/weed_killing/src/weed_killing/srv/QueryServoAngle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/weed_killing
)

### Generating Module File
_generate_module_py(weed_killing
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/weed_killing
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(weed_killing_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(weed_killing_generate_messages weed_killing_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lmk/weed_killing/src/weed_killing/msg/SetServoAngle.msg" NAME_WE)
add_dependencies(weed_killing_generate_messages_py _weed_killing_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lmk/weed_killing/src/weed_killing/msg/SetServoDamping.msg" NAME_WE)
add_dependencies(weed_killing_generate_messages_py _weed_killing_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lmk/weed_killing/src/weed_killing/srv/QueryServoAngle.srv" NAME_WE)
add_dependencies(weed_killing_generate_messages_py _weed_killing_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(weed_killing_genpy)
add_dependencies(weed_killing_genpy weed_killing_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS weed_killing_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/weed_killing)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/weed_killing
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(weed_killing_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/weed_killing)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/weed_killing
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(weed_killing_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/weed_killing)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/weed_killing
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(weed_killing_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/weed_killing)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/weed_killing
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(weed_killing_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/weed_killing)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/weed_killing\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/weed_killing
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(weed_killing_generate_messages_py std_msgs_generate_messages_py)
endif()
