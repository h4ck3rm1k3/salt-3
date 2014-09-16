{% from "ssh/map.jinja" import ssh with context %}

sshd_config:
  file.managed:
    - name: {{ ssh.sshd_conf }}
    - source: salt://ssh/sshd_config

sshd:
  service:
    - running
    - name: {{ ssh.service }}
    - enable: True
    - watch:
      - file: sshd_config
