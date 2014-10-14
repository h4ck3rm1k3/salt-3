{% if grains['os'] == 'XenServer' %}
salt-minion:
  pkg:
    - installed

{% else %}
salt-minion-other:
  pkg.installed:
    - pkgs:
      - salt-minion
      - python-msgpack
{% endif %}
