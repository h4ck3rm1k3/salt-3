#include_tpl:
#  cmd.run:
#    - name: echo "$IncludeConfig /etc/rsyslog.d/*.conf" >> /etc/rsyslog.conf
#    - unless: grep -q rsyslog.d /etc/rsyslog.conf
#    - stateful: True

#{% if grains['os'] == 'XenServer' %}
#sendmail:
#  file.managed:
#    - name: /tmp/sendmail.sh
#    - source: salt://syslog/sendmail.sh
#    - mode: 0755
#
#rsyslog-sendmail:
#  file.recurse:
#    - name: /etc/rsyslogd.d
#    - source: salt://syslog/rsyslog.d
#    - mkdirs: True
#    - clean: True
#    - require:
#      - file: sendmail
#      - pkg: rsyslog
#{% endif %}
