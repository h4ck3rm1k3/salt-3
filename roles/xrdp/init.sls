/etc/xrdp/xrdp.conf:
  pkg:
    - installed
    - name: xrdp
  file.managed:
{% if grains['os'] == 'XenServer' %}
    - source: salt://xrdp/xrdp.conf
    - require:
      - pkg: xrdp
{% endif %}
  service:
    - name: xrdp
    - running
    - reload: True
    - enable: True
