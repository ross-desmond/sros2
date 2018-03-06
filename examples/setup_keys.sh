rm -rf `pwd`/demo_keys
curl -sk https://raw.githubusercontent.com/ros2/sros2/accesscontrol_fastrtps/examples/apex_config.yaml -o policies.yaml
ros2 security create_keystore demo_keys

for node in talker listener ros_bridge lidar_tracker; do ros2 security create_key demo_keys $node ; ros2 security create_permission demo_keys $node policies.yaml; done
