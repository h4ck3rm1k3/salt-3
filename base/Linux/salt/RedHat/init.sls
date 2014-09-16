{% if grains['os'] == 'XenServer' %}
salt-repo:
  file.managed:
    - name: /etc/yum.repos.d/salt.repo
    - source: salt://salt/RedHat/salt.repo

salt-minion:
  pkg:
    - installed
    - require:
      - file: salt-repo
{% endif %}

salt-minion:
  pkg.installed:
    - pkgs:
      - salt-minion
      - python-msgpack
