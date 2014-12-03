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
    if re.match(r'^Default Gateway IP\s+', line):
      (k, v) = line.split(':')
      ipmi['defgw_ip'] = v.strip(' ')
    if re.match(r'^Default Gateway MAC\s+', line):
      (k, v) = line.split(':', 1)
      ipmi['defgw_mac'] = v.strip(' ')
    
  grains = {}
  grains['ipmi'] = {}
  grains['ipmi'] = ipmi
  return grains
