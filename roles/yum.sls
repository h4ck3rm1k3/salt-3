yum_proxy:
  cmd.run:
    - name: echo "proxy=http://squid:3142" >> /etc/yum.conf
    - unless: egrep -q '^proxy=http://squid:3142' /etc/yum.conf
    - stateful: True

yum-utils:
  pkg.installed
