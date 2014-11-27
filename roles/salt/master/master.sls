salt-master:
  pkg:
    - installed
  service.running:
    - enable: True
    - reload
    - watch:
      - file: /etc/salt/master

salt-roster:
  file.managed:
    - name: /etc/salt/roster
    - source: salt://salt/roster
    - require:
      - pkg: salt-master
