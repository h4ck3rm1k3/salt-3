nagios-plugins:
  pkg.installed:
    - pkgs:
      - nagios-plugins-ping
      - nagios-plugins-setuid

check_mk-agent:
  pkg.latest:
    - pkgs:
      - xinetd
      - check_mk-agent-logwatch
      - check_mk-agent
      - mtr
      - pynag

allow_tcp_port_6556:
  cmd.run:
    - name: iptables -I INPUT 1 -m tcp -p tcp --dport 6556 -j ACCEPT
    - unless: iptables -L | grep -q 6556
    - stateful: True

iptables_save:
  cmd.wait:
    - name: iptables-save > /etc/sysconfig/iptables
    - stateful: True
    - onlyif: iptables -L | grep -q 6556
    - watch:
      - cmd: allow_tcp_port_6556

cmk-repo:
  file.managed:
    - name: /etc/yum.repos.d/cmk.repo
    - source: salt://mk_agent/{{ grains['os_family'] }}/cmk.repo

nsca_client:
  pkg.installed:
    - name: nagios-nsca-client
  file.managed:
    - name: /etc/nagios/send_nsca.cfg
    - source: salt://mk_agent/send_nsca.cfg
    - require:
      - pkg: nagios-nsca-client

{% if grains['osrelease'].startswith('5') %}

python-hashlib:
  pkg.installed

{% endif %}
