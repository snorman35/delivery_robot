#!/bin/bash

# make sure the ros build tools are installed
sudo apt install python-rosdep -y
sudo apt install python-rosinstall -y
sudo apt install python-rosinstall-generator -y
sudo apt install python-wstool -y
sudo apt install build-essential -y

# install the ros packages needed
sudo apt install ros-${ROS_DISTRO}-joy -y
sudo apt install ros-${ROS_DISTRO}-ddynamic-reconfigure -y
sudo apt install ros-${ROS_DISTRO}-rtabmap-ros -y
sudo apt install ros-${ROS_DISTRO}-depthimage-to-laserscan -y
sudo apt install ros-${ROS_DISTRO}-move-base -y
sudo apt install ros-${ROS_DISTRO}-dwa-local-planner -y
