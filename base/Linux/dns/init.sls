include:
  - xenserver.sls

squid:
  host.present:
    - ip: 192.168.31.246

ftp01:
  host.present:
    - ip: 192.168.31.245

ntp:
  host.present:
    - ip: 192.168.11.10
