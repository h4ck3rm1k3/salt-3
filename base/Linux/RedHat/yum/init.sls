yum_proxy:
  cmd.run:
    - name: echo "proxy=http://squid:3142" >> /etc/yum.conf
    - unless: egrep -q '^proxy=http://squid:3142' /etc/yum.conf
    - stateful: True

yum-utils:
  pkg.installed

etckeeper:
  pkg.installed:
    - require:
      - pkg: yum-utils

etckeeper_init:
  cmd.run:
    - name: etckeeper init > /dev/null 1>&2
    - stateful: True
    - require:
      - pkg: etckeeper
