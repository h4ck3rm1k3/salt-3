{% if grains['os_family'] =='RedHat' %}
{% set ntp = ntp %}
{% endif %}

{% if grains['os_family'] =='Debian' %}
{% set ntp = ntpd %}
{% endif %}
ntp:
  hosts.present:
    - ip: 192.168.11.10

ntpd:
  pkg:
    - installed
    - name: {{ ntp }}
  service:
    - running
    - enable: True
    - reload: True
    - watch:
      - file: /etc/ntp.conf
    - require:
      - pkg: ntp

ntp_conf:
  file.managed:
    - name: /etc/ntp.conf
    - source: salt://ntp/ntp.conf
