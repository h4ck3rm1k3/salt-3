include:
  - .{{ grains['os_family'] }}

vncpassword:
   cmd.script:
     - source: salt://service/vnc/vncpassword.sh
     - require:
       - pkg: tigervnc-server
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
