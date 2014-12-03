salt-master:
  pkg:
    - installed
  file:
    - managed
    - name: /etc/salt/master
    - source: salt://salt/master.conf.jinja
    - template: jinja
    - require:
      - pkg: salt-master
  service:
    - running
    - reload: True
    - enable: True
    - watch:
      - file: /etc/salt/master
    - require:
      - file: /etc/salt/master

salt-roster:
  file.managed:
    - name: /etc/salt/roster
    - source: salt://salt/roster.conf.jinja
    - template: jinja
    - require:
      - pkg: salt-master
