include:
  - .{{ grains['os_family'] }}

vncpassword:
   cmd.script:
     - source: salt://service/vnc/vncpassword.sh
     - require:
       - sls: vncserver
     - statful: True

xrdp:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - reload: True
