/tmp/centos:
  file.managed:
    - source: salt://TEST/centosmain.menu
    - template: jinja
