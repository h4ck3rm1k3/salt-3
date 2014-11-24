#!/usr/bin/python
#import commands, os
#import salt.utils

#def ipmi():
#  info = commands.getoutput('ipmitool lan print')
#  print info
#  ipmi = {}
#  ipmi['ip'] = ''
#  ipmi['netmask'] = ''
#  ipmi['gateway'] = ''
#  return ipmi

def license():
        import XenAPI

        license = {}
        s = XenAPI.xapi_local()
        s.xenapi.login_with_password('root', '')
        hosts = s.xenapi.host.get_all()
        host = hosts[0]
        record = s.xenapi.host.get_record(host)
        s.xenapi.session.logout()
        license = record['license_params']
        retrun license
