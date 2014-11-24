/tmp/hsflowd-xenserver602-1_22_2.iso:
  file.managed:
    - source: http://10.24.4.4/software/sflow/hsflowd-xenserver602-1_22_2.iso
xe-install-supplemental-pack /tmp/hsflowd-xenserver602-1_22_2.iso:
  cmd.run
/etc/hsflowd.conf
  file.managed:
    - source: salt://etc/hsflowd.conf
    - require:
      - pkg: hsflowd
hsflowd:
  service:
    - running
    - enable: False
    - require:
      - pkg: hsflowd
