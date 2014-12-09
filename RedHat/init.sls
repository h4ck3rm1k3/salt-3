include:
  - yum
  - repos
  - ipmi
  - ntp
  - cmk.agent

sshd_config:
  cmd.run:
    - name: sed -r -i '/UseDNS|GSSAPIAuthentication/s/yes/no/' /etc/ssh/sshd_config
    - stateful: True
    
{% if not grains['os'] == 'XenServer' %}
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
{% endif %}

crond:
  service:
    - running
    - enable: True
  pkg:
    - installed
    - name: time

cpanm:
  file.managed:
    - name: /usr/bin/cpanm
    - source: salt://RedHat/cpanm
    - mode: 0755
