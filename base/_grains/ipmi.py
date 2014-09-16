#!/usr/bin/python
import commands, os
import salt.utils

def ipmi():
  info = commands.getoutput('ipmitool lan print')
  print info
#  ipmi = {}
#  ipmi['ip'] = ''
#  ipmi['netmask'] = ''
#  ipmi['gateway'] = ''
#  return ipmi

ipmi()
