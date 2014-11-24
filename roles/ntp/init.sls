{% if grains['os_family'] =='RedHat' %}
{% set ntp = 'ntp' %}
{% endif %}

{% if grains['os_family'] =='Debian' %}
{% set ntp = ntpd %}
{% endif %}

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
    - source: salt://ntp/ntp.conf.jinja
    - template: jinja

Asia/Shanghai:
  timezone.system:
    - utc: False

hwclock -w:
  cmd.run:
    - onlyif: test -f /dev/rtc
    - stateful: True
