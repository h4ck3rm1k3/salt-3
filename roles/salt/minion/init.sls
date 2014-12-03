{% if grains['os'] == 'XenServer' %}
salt_repo-xenserver:
  file.managed:
    - name: /etc/yum.repos.d/salt.repo
    - source: salt://salt/salt.repo-XenServer
{% endif %}

{% if grains['os_family'] == 'Debian' %}
salt-sources:
  file.managed:
    - name: /etc/apt/sources.list.d/salt.list
    - source: salt://salt/salt.list-{{ grains['os'] }}
    - template: jinja

salt-ppa-key:
  file.managed:
    - name: /tmp/salt.key
    - source: salt://salt/salt.key-{{ grains['os'] }}
  cmd.run:
    - name: apt-key add /tmp/salt.key 1 > /dev/null
    - unless: apt-key list | grep -q salt
    - stateful: True
{% endif %}

salt-minion:
  pkg.installed:
    - names:
      - salt-minion
      - python-software-properties
      - msgpack-python
      - python-jinja2
  service:
    - running
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
