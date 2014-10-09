include:
   - .{{ grains['os_family'] }}

xinetd:
  pkg:
    - installed
  service:
    - running
    - enable: True

builtin_plugins:
  file.recurse:
    - name: /usr/lib/check_mk_agent/plugins
    - source: salt://check_mk/plugins
    - file_mode: 755
    - clean: True

custom_plugins:
  file.recurse:
    - name: /usr/lib/check_mk_agent/custom
    - source: salt://check_mk/custom
    - file_mode: 755
    - mkdirs: True
    - clean: True

mkdir /etc/check_mk:
  cmd.run:
    - unless: test -d /etc/check_mk
    - stateful: True

/etc/check_mk/mrpe.cfg:
  file.managed:
    - source: salt://check_mk/mrpe.cfg
    - template: jinja
    - file_mode: 644

/etc/check_mk/logwatch.cfg:
  file.managed:
    - source: salt://check_mk/logwatch.cfg
    - template: jinja
    - file_mode: 644
