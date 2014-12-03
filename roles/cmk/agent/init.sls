include:
{% if grains['os_family'] == 'RedHat' %}
  - RedHat
{% endif %}

xinetd:
  pkg:
    - installed
  service:
    - running
    - enable: True

cmk_plugin-deps:
  pkg.latest:
    - names:
      - dmidecode
      - freeipmi
      - bind-utils

local_checks:
  file.recurse:
    - name: /usr/lib/check_mk_agent/local
    - source: salt://cmk/agent/local
    - file_mode: 755
    - clean: True

builtin_plugins:
  file.recurse:
    - name: /usr/lib/check_mk_agent/plugins
    - source: salt://cmk/agent/plugins
    - file_mode: 755
    - clean: True

mkdir /etc/check_mk:
  cmd.run:
    - unless: test -d /etc/check_mk
    - stateful: True

cmk_agent-mrpe:
  pkg.installed:
    - name: nagios-plugins-dns
  file.managed:
    - name: /etc/check_mk/mrpe.cfg
    - source: salt://cmk/agent/mrpe.cfg.jinja
    - template: jinja
    - file_mode: 644
    - require:
      - pkg: nagios-plugins-dns

cmk_agent-logwatch:
  pkg.installed:
    - name: check_mk-agent-logwatch
  file.managed:
    - name: /etc/check_mk/logwatch.cfg
    - source: salt://cmk/agent/logwatch.cfg.jinja
    - template: jinja
    - file_mode: 644
    - require:
      - pkg: check_mk-agent-logwatch
