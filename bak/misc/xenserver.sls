dbtool:
  file.managed:
    - name: /usr/local/bin/dbtool
    - source: salt://usr/local/bin/dbtool
    - mode: 755
    - backup: minion
