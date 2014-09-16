include:
  - .{{ grains['os_family'] }}

salt:
  host.present:
    - ip: 192.168.12.7

salt-minion-daemon:
  pkg.installed:
    - names:
      - salt-minion
      - python-jinja2
  service:
    - name: salt-minion
    - running
    - enable: True
    - reload: True
    - watch:
      - file: /etc/salt/minion

minion_conf:
  file:
    - managed
    - name: /etc/salt/minion
    - source: salt://salt/minion
