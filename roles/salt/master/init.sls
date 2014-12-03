salt-master:
  pkg:
    - installed
    - names:
      - salt-master
      - salt-api
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

ssh_conf:
  file.managed:
    - name: /etc/ssh/ssh_config
    - source: salt://salt/master/ssh_config.jinja

