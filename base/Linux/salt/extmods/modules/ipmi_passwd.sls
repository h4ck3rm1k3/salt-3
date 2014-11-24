set_password:
  cmd.run:
    - name: echo $HOSTNAME | xargs ipmitool user set password 2
    - stateful: True
