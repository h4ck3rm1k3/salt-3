include:
  - .yum
  - .repos

sshd_config:
  cmd.run:
    - name: sed -r -i '/UseDNS|GSSAPIAuthentication/s/yes/no/' /etc/salt/ssh/sshd_config
    - stateful: True
    
basic_utils:
  pkg.installed:
    - names:
      - iptstate

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

crond:
  service:
    - running
    - enable: True

time:
  pkg.installed
