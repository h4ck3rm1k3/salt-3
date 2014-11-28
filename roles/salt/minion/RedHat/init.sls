{% if grains['os'] == 'XenServer' %}
salt-repo:
  file.managed:
    - name: /etc/yum.repos.d/salt.repo
    - source: salt://salt/RedHat/salt.repo
    - template: jinja
{% endif %}

salt-minion:
  pkg.installed:
    - pkgs:
      - salt-minion
      - python-msgpack
  service:
    - running
    - enable: True
    - reload: True
    - require:
      - pkg: salt-minion
