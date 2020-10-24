import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import Joy

class Node():
    def __init__(self):
        rospy.init_node("teleop_360", anonymous=True)
        rospy.Subscriber("joy", Joy, self.callback)
        self.pub_node = rospy.Publisher("/cmd_vel", Twist, queue_size=10)
        self.rate = rospy.Rate(10)


        self.run_node()

    def callback(self, data):
        # 2, 5
        lt = (data.axes[2] - 1) / 12
        rt = (data.axes[5] - 1) / -12
        linvel = 0
        # xor the inputs so only one trigger can be used
        if bool(lt) != bool(rt):
            linvel = lt if lt else rt

        ls = data.axes[0]
        angvel = 0
        if abs(ls) >= 0.2:
            angvel = (abs(ls) - 0.2) / 0.8
            if ls < 0:
                angvel *= -1

        print("msg")
        print("vel: {}".format(linvel))
        print("angvel: {}".format(angvel))

        velmsg = Twist()
        velmsg.linear.x = linvel
        velmsg.linear.y = 0
        velmsg.linear.z = 0
        velmsg.angular.x = 0
        velmsg.angular.y = 0
        velmsg.angular.z = angvel

        self.pub_node.publish(velmsg)

    def run_node(self):
        rospy.spin()

if __name__ == "__main__":
    Node()