/etc/hosts.allow:
  file.managed:
    - source: salt://service/hosts.allow.jinja
    - template: jinja

/etc/hosts.deny:
  file.managed:
    - source: salt://service/hosts.deny.jinja
    - template: jinja
