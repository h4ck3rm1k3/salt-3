#domain: hdtr.com
salt: 192.168.12.7
ftp01: 192.168.31.245
squid: 192.168.31.246
pxe: 192.168.11.8
wiki: 192.168.12.3
ntp: 192.168.11.10
nagios01: 192.168.11.9
nagios02: 192.168.31.247
#nagios01.bqj.hdtr.com: 172.31.3.200
#salt-test:
