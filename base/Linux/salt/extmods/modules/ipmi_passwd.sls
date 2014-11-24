set_password:
  cmd.run:
    - name: echo $HOSTNAME | ipmitool user set password 2 - > /dev/null
    - stateful: True
