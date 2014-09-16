resolv:
  file.managed:
    - name: /etc/resolv.conf
    - source: salt://resolv/resolv.conf.jinja
    - template: jinja
