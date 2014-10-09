ftp01:
  host.present:
    - ip: 192.168.31.245

squid:
  host.present:
    - ip: 192.168.31.246

check_mk-source:
  file.managed:
    - name: /etc/apt/sources.list.d/check_mk.list
    - source: salt://check_mk/{{ grains['os_family'] }}/check_mk.list.jinja
    - template: jinja

check-mk-agent:
  cmd.run:
    - name: apt-get install check-mk-agent --force-yes -y > /dev/null
    - stateful: True
    - unless: dpkg -l | grep -q check-mk-agent 
    - require:
      - file: /etc/apt/sources.list.d/check_mk.list

xinetd_check_mk:
  file.managed:
    - name: /etc/xinetd.d/check_mk
    - source: salt://check_mk/xinetd_check_mk.jinja
    - mode: 644
    - require:
      - sls: check-mk-agent
