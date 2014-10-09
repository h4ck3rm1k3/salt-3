include:
  - .yum
  - .repos

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

disable_selinux:
  cmd.run:
    - name: senenforce 0 ;sed -i '/^SELINUX/s/enforcing/disabled/' /etc/selinux/config
    - onlyif: test -f /etc/selinux/config
    - stateful: True
