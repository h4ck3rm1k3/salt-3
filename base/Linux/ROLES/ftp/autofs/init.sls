autofs:
  pkg:
    - installed

auto.master:
  file.managed:
    - name: /etc/auto.master
    - source: salt://ROLES/ftp/autofs/auto.master
    - clean: True
    - require:
      - pkg: autofs

automount:
  file.recurse:
    - name: /etc/automount
    - source: salt://ROLES/ftp/autofs/automount
    - clean: True
    - require:
      - pkg: autofs
      - file: /etc/auto.master

autofs-daemon:
  service:
    - name: autofs
    - running
    - reload: True
    - watch:
      - file: automount
    - enable: True
    - require:
      - file: /etc/auto.master
      - pkg: autofs
