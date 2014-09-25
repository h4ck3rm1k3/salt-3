ftp01:
  host.present:
    - ip: 192.168.31.245

squid:
  host.present:
    - ip: 192.168.31.246

check_mk-source:
  file.managed:
    - name: /etc/apt/sources.list.d/check_mk.list
    - source: salt://check_mk/{{ grains['os_family'] }}/check_mk.list.jinja
    - template: jinja
  pkg.installed:
    - name: check-mk-agent
    - refresh: True
  cmd.run:
    - name: sed -i '/disable/s/yes/no/' /etc/xinetd.d/check_mk
    - onlyif: grep -q yes /etc/xinetd.d/check_mk
    - stateful: True
