yum_proxy:
  cmd.run:
    - name: echo "proxy=http://squid:3142" >> /etc/yum.conf
    - unless: egrep -q '^proxy=http://squid:3142' /etc/yum.conf
    - stateful: True


yum-utils:
  cmd.run:
    - name: yum install -y yum-utils > /dev/null
    - stateful: True
    - unless: rpm -qa | grep -q yum-utils > /dev/null

etckeeper:
  pkg:
    - installed
  cmd.run:
    - name: etckeeper init > /dev/null 1>&2
    - stateful: True
