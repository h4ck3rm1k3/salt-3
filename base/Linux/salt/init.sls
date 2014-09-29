include:
  - .{{ grains['os_family'] }}

salt:
  host.present:
    - ip: 192.168.12.7

python-jinja2:
  pkg.installed

salt-minion-conf:
  file:
    - managed
    - name: /etc/salt/minion
    - source: salt://salt/minion
    - require:
      - pkg: salt-minion

start_salt-minion:
  service:
    - name: salt-minion
    - running
    - enable: True
    - reload: True
    - require:
      - file: mine_conf

mine_conf:
  file.recurse:
    - name: /etc/salt/minion.d
    - source: salt://salt/minion.d
