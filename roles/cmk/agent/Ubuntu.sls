check_mk-source:
  file.managed:
    - name: /etc/apt/sources.list.d/check_mk.list
    - source: salt://cmk/agent/source.list-{{ grains['os'] }}.jinja
    - template: jinja

check_mk-agent:
  pkg:
    - installed
    - name: nagios-plugins-basic
  cmd:
    - run
    - name: apt-get install check-mk-agent --force-yes -y > /dev/null
    - stateful: True
    - unless: dpkg -l | grep -q check-mk-agent 
    - require:
      - file: /etc/apt/sources.list.d/check_mk.list
