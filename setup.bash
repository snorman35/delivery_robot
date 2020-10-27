#!/bin/bash

# This will setup all the dependencies for the delivery robot

# setup the keys for librealsense
sudo apt-key adv --keyserver keys.gnupg.net --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo bionic main" -u

sudo apt update

# install the realsense packages
sudo apt-get install librealsense2-dkms -y
sudo apt-get install librealsense2-utils -y
sudo apt-get install librealsense2-dev -y
sudo apt-get install librealsense2-dbg -y

# make sure the ros build tools are installed
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential -y
sudo rosdep init
rosdep update

# install the ros packages needed
sudo apt install ros-${ROS_DISTRO}-joy -y
sudo apt install ros-${ROS_DISTRO}-ddynamic_reconfigure -y
sudo apt install ros-${ROS_DISTRO}-rtabmap-ros -y

# compile the workspace
catkin_make clean
catkin_make