autofs:
  pkg:
    - installed

auto.master:
  file.managed:
    - name: /etc/auto.master
    - source: salt://service/autofs/auto.master
    - clean: True
    - require:
      - pkg: autofs

automount:
  file.recurse:
    - name: /etc/automount
    - source: salt://service/autofs/automount
    - clean: True
    - require:
      - pkg: autofs
      - file: auto.master

autofs-daemon:
  service:
    - name: autofs
    - running
    - reload: True
    - watch:
      - file:
        - names:
          - auto.master
          - automount
    - enable: True
    - require:
      - file: /etc/autofs
      - pkg: autofs
