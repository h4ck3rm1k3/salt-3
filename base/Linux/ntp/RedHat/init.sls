ntpd-pkg:
  pkg.installed:
    - name: ntp

ntpd:
  service.running:
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
