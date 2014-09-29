include:
  - .{{ grains['os_family'] }}

vncpassword:
   cmd.script:
     - source: salt://service/vnc/vncpassword.sh
     - require:
       - pkg: tigervnc-server
     - statful: True

xrdp:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - reload: True
