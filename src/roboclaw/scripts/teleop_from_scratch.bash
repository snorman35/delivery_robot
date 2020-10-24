!#/bin/bash

/home/sam/ros_testing/roboclaw_ws/run.bash &

sleep 4

rosrun joy joy_node
sleep 2

python2 /home/sam/ros_testing/roboclaw_ws/src/roboclaw/scripts/teleop_360.py