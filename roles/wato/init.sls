hosts_mk:
  file.managed:
    - name: /tmp/hosts.mk
    - source: salt://service/wato/hosts.mk.jinja
    - template: jinja
