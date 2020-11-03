#!/bin/bash

dir_path=$(dirname $(realpath $0))

# This will setup all the dependencies for the delivery robot
${dir_path}/realsense.bash
${dir_path}/ros_dependencies.bash

# compile the workspace
catkin_make clean
catkin_make
# run a second time to resolve a missing dependency
catkin_make