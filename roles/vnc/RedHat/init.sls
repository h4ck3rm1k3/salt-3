vncserver:
  pkg.installed:
    - names:
      - tigervnc-server
      - libXfont
      - pixman
      - uuidd
      - pax
  file.managed:
    - name: /etc/sysconfig/vncservers
    - source: salt://service/vnc/vncservers
  cmd.run:
    - name: sed -i '/initdefault/s/3/5/' /etc/inittab
    - stateful: True

xrdp:
  pkg:
    - installed
  cmd.run:
    - name: startx > /dev/null
    - unless: runlevel | grep -q 3
    - stateful: True
    - require:
      - pkg: xrdp
  service:
    - running
    - enable: True
    - reload: True

set_path:
  cmd.run:
    - name: echo "PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin" >> /root/.bashrc

init_5:
  cmd.run:
    - name: sed -i '/initdefault/s/3/5/' /etc/inittab

disable_ctrl_alt_del:
  cmd.run:
    - name: sed -i '/^exec/s/^/#/' /etc/init/control-alt-delete.conf
    - stateful: True
