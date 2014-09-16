etckeeper:
  pkg.installed

init_etckeeper:
  cmd.run:
    - name: etckeeper init > /dev/null 1>&2
    - unless: test -d /etc/.git
    - stateful: True
