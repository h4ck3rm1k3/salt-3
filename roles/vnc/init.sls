vncserver:
  service:
    - running
    - enable: True
    - reload: True
    - require:
      - cmd: vncpassword
  file.managed:
    - name: /tmp/vncpasswd
    - source: salt://vnc/vncpasswd.jinja
  cmd.run:
    - name: vncpasswd -f /tmp/vncpasswd > /dev/null
    - stateful: True
