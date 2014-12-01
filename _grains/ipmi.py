'''
ipmitool lan print output:

IP Address Source       : Static Address
IP Address              : 192.168.10.13
Subnet Mask             : 255.255.255.0
MAC Address             : 00:25:90:77:f2:08
SNMP Community String   : public
IP Header               : TTL=0x00 Flags=0x00 Precedence=0x00 TOS=0x00
Default Gateway IP      : 192.168.10.254
Default Gateway MAC     : e8:e7:32:52:b9:fc
Backup Gateway IP       : 0.0.0.0
Backup Gateway MAC      : 00:00:00:00:00:00
802.1q VLAN ID          : Disabled
802.1q VLAN Priority    : 0
'''
def ipmi():
  import commands, re
  info = commands.getoutput('ipmitool lan print')
  ipmi = {}
  for line in info.split('\n'):
    if re.match(r'IP Address Source\s+', line):
      (k, v) = line.split(':')
      ipmi['ipsrc'] = v.strip(' ')
    if re.match(r'^IP Address\s+', line):
      (k, v) = line.split(':')
      ipmi['ipaddr'] = v.strip(' ')
    if re.match(r'^Subnet Mask\s+', line):
      (k, v) = line.split(':')
      ipmi['netmask'] = v.strip(' ')
    if re.match(r'^MAC Address\s+', line):
      (k, v) = line.split(':', 1)
      ipmi['mac'] = v.strip(' ')
    if re.match(r'^SNMP Community String\s+', line):
      (k, v) = line.split(':')
      ipmi['snmp_comm'] = v.strip(' ')
    if re.match(r'^Default Gateway IP\s+', line):
      (k, v) = line.split(':')
      ipmi['defgw_ip'] = v.strip(' ')
    if re.match(r'^Default Gateway MAC\s+', line):
      (k, v) = line.split(':', 1)
      ipmi['defgw_mac'] = v.strip(' ')
    if re.match(r'^802.1q VLAN ID\s+', line):
      (k, v) = line.split(':')
      ipmi['vlan_id'] = v.strip(' ')
    
  grains = {}
  grains['ipmi'] = {}
  grains['ipmi'] = ipmi
  return grains
