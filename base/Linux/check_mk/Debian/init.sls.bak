/tmp/check-mk-agent:
  file.managed:
    - name: /tmp/check-mk-agent_1.2.4p5-2_all.deb
    - source: salt://check_mk/Debian/check-mk-agent_1.2.4p5-2_all.deb
  cmd.run:
    - name: dpkg -i /tmp/check-mk-agent_1.2.4p5-2_all.deb > /dev/null
    - unless: dpkg -l | grep -q check-mk-agent
    - stateful: True

nsca:
  pkg:
    - installed
  file.managed:
    - name: /etc/send_nsca.cfg
    - source: salt://check_mk/send_nsca.cfg
    - require:
      - pkg: nsca

nagios-plugins-basic:
  pkg.installed
