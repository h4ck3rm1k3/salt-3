def xe():
  import re, inventory, commands
  uuid = inventory.get_localhost_uuid()
  output = commands.getoutput('xe host-license-view host-uuid=%s' % uuid)
  license = {}
  for line in output.split('\n'):
    if re.match('^version', line):
      print line
    if re.match('^\s+expiry', line):
      print line
    if re.match('^\s+productcode', line):
      print line
    if re.match('^\s+name', line):
      print line

#  grains['license'] = license
#  return grains

xe()

