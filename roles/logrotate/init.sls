maxage:
  cmd.run:
    - name: sed -i 's/^rotate.*$/maxage 7/' /etc/logrotate.conf
    - unless: grep -q maxage /etc/logrotate.conf
    - stateful: True

logrotate -f /etc/logrotate.conf:
  cmd.run:
    - stateful: True
    - require:
      - cmd: maxage
    - stateful: True

