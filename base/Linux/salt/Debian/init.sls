apt-sources:
  file.managed:
    - name: /etc/apt/sources.list
    - source: salt://salt/Debian/sources.list-{{ grains['os'] }}
    - template: jinja
  
salt-sources:
  file.managed:
    - name: /etc/apt/sources.list.d/salt.list
    - source: salt://salt/Debian/salt.list-{{ grains['os'] }}
    - template: jinja

salt-ppa-key:
  file.managed:
    - name: /tmp/salt.key
    - source: salt://salt/Debian/salt.key-{{ grains['os'] }}

add-ppa-key:
  cmd.run:
    - name: apt-key add /tmp/salt.key 1 > /dev/null
    - unless: apt-key list | grep -q salt
    - stateful: True
    - require:
      - file: /tmp/salt.key
    
salt-deps:
  pkg.installed:
    - names:
      - python-software-properties
      - msgpack-python

