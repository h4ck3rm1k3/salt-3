include:
  - .yum
  - .repos

squid:
  host.present:
    - ip: 192.168.31.246

ftp01:
  host.present:
    - ip: 192.168.31.245

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

{% if grains['osrelease'][0] == '6' %}
sed -i '/releasever/s/\$releasever/6/' /etc/yum.repos.d/*:
  cmd.run:
    - stateful: True
    - require:
      - file: yum_repos

{% elif grains['osrelease'][0] == '5' %}
sed -i '/releasever/s/\$releasever/5/' /etc/yum.repos.d/*:
  cmd.run:
    - stateful: True

{% endif %}
