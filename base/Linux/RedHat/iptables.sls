iptstate:
  pkg.installed

iptables:
  service:
    - dead
    - enable: False

ip6tables:
  service:
    - dead
    - enable: False

setenforce 0:
  cmd.run:
    - unless: getenforce | grep -q Disabled
    - stateful: True

disable_selinux:
  cmd.run:
    - name: sed -i '/^SELINUX/s/enforcing/disabled/' /etc/selinux/config
    - onlyif: test -f /etc/selinux/config
    - stateful: True
