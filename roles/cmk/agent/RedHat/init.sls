{% if grains['os'] == 'XenServer' %}

python-hashlib:
  pkg.installed

{% endif %}

mk_agent:
  pkg.latest:
    - names:
      - xinetd
      - check_mk-agent
  file.managed:
    - name: /etc/yum.repos.d/cmk.repo
    - source: salt://cmk/agent/{{ grains['os_family'] }}/cmk.repo

mk_agent-plugins:
  pkg.latest:
    - pkgs:
      - mtr
      - pynag
      - nagios-plugins-ping
      - nagios-plugins-dns
      - nagios-plugins-setuid
    - require:
      - pkg: check_mk-agent

mk_agent-iptables:
  cmd.run:
    - name: iptables -I INPUT 1 -m tcp -p tcp --dport 6556 -j ACCEPT
    - unless: iptables -L | grep -q 6556
    - stateful: True
    - require:
      - pkg: check_mk-agent

mk_iptables-save:
  cmd.wait:
    - name: iptables-save > /etc/sysconfig/iptables
    - stateful: True
    - unless: grep 6556 -q /etc/sysconfig/iptables
    - watch:
      - cmd: mk_agent-iptables
