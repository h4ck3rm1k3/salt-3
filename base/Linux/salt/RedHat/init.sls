{% if grains['os'] == 'XenServer' %}
salt-minion:
  file.managed:
    - name: /etc/yum.repos.d/salt.repo
    - source: salt://salt/RedHat/salt.repo
    - template: jinja

  pkg:
    - installed

{% else %}
salt-minion-other:
  pkg.installed:
    - pkgs:
      - salt-minion
      - python-msgpack
{% endif %}
