salt-sources:
  file.managed:
    - name: /etc/apt/sources.list.d/salt.list
    - source: salt://salt/Debian/salt.list-{{ grains['os'] }}
    - template: jinja

salt-ppa-key:
  file.managed:
    - name: /tmp/salt.key
    - source: salt://salt/Debian/salt.key-{{ grains['os'] }}
  cmd.run:
    - name: apt-key add /tmp/salt.key 1 > /dev/null
    - unless: apt-key list | grep -q salt
    - stateful: True

salt-minion:
  pkg.installed:
    - names:
      - python-software-properties
      - msgpack-python
      - salt-minion
  service.running:
    - name: salt-minion
    - enable: True
    - reload: True
  file.managed:
    - name: /etc/salt/minion
    - source: salt://salt/minion

salt-minion.d:
  file.recurse:
    - name: /etc/salt/minion.d
    - source: salt://salt/minion.d
    - require:
      - pkg: salt-minion
