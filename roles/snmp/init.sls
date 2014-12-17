net-snmp:
  pkg:
    - installed
    - name: net-snmp
  file:
    - managed
    - name: /etc/snmp/snmpd.conf
    - source: salt:/snmp/snmpd.conf.jinja
    - template: jinja
  service:
    - running
    - enable: True
    - reload: True
    - require:
      - pkg: net-snmp
    - watch:
      - file: /etc/snmp/snmpd.conf

iptables:
  service:
    - dead
    - enable: False
    - name: iptables
