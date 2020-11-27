cmake_minimum_required(VERSION 2.8.3)
project(robot_gazebo)

# Check for c++11 / c++0x support
include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
CHECK_CXX_COMPILER_FLAG("-std=c++0x" COMPILER_SUPPORTS_CXX0X)
if(COMPILER_SUPPORTS_CXX11)
    set(CMAKE_CXX_FLAGS "-std=c++11")
elseif(COMPILER_SUPPORTS_CXX0X)
    set(CMAKE_CXX_FLAGS "-std=c++0x")
else()
    message(FATAL_ERROR "The compiler ${CMAKE_CXX_COMPILER} has no C++11 support. Please use a different C++ compiler.")
endif()

# Load catkin and all dependencies required for this package
find_package(catkin REQUIRED COMPONENTS
  gazebo_dev
  gazebo_msgs
  roscpp
  nodelet
  sensor_msgs
  urdf
  tf
  tf2_ros
  rosconsole
  diagnostic_updater
  std_msgs
  gazebo_ros
  image_transport
  camera_info_manager
  nav_msgs
)

# Depend on system install of Gazebo
find_package(gazebo REQUIRED)

link_directories(${GAZEBO_LIBRARY_DIRS})
include_directories(${Boost_INCLUDE_DIR} ${catkin_INCLUDE_DIRS} ${GAZEBO_INCLUDE_DIRS})

# For gazebo_ros_diff_drive_six plugin
add_library(gazebo_ros_diff_drive_six src/gazebo_ros_diff_drive_six.cpp)
target_link_libraries(gazebo_ros_diff_drive_six ${catkin_LIBRARIES} ${GAZEBO_LIBRARIES})


catkin_package(
  LIBRARIES
  gazebo_ros_diff_drive_six

  DEPENDS 
  gazebo_msgs
  roscpp
  rospy
  geometry_msgs
  nav_msgs
  tf
  tf2_ros
  sensor_msgs
  rosconsole
  std_msgs
)