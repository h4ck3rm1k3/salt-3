salt-master
  pkg.installed:
    - names:
      - salt-master
      - salt-api
  file.managed:
    - name: /etc/salt/master
    - require:
      - pkg: salt-master
  service.running:
    - name: salt-master
    - enable: True
    - reload: True
    - watch:
      - file: /etc/salt/master
    - require:
      - pkg: salt-master

ssh_conf:
  file.managed:
    - name: /etc/ssh/ssh_config
    - source: salt://salt/master/ssh_config

