vncserver:
  pkg.installed:
    - names:
      - tigervnc-server
      - libXfont
      - pixman
  file.managed:
    - name: /etc/sysconfig/vncservers
    - source: salt://service/vnc/vncservers
  service.running:
    - enable: True
    - reload: True
    - require:
      - cmd: vncpassword
  cmd.run:
    - name: sed -i '/initdefault/s/3/5/' /etc/inittab
    - stateful: True
