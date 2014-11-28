vncserver:
  cmd.script:
    - source: salt://vnc/set_vncpasswd.sh
    - stateful: True
  service:
    - running
    - enable: True
    - reload: True
