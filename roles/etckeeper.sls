etckeeper:
  pkg.installed:
    - require:
      - pkg: yum-utils

etckeeper_init:
  cmd.run:
    - name: etckeeper init > /dev/null 1>&2
    - stateful: True
    - require:
      - pkg: etckeeper
