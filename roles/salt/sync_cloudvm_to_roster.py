#!/usr/bin/python
import CloudStack

def get_cs():
  api = 'http://csm01:8080/client/api'
  #admin
  apikey='f0Q70X5oTpax-b7bvyzDQf2t_rKaK0rWkLXhejPRqI4i6IgiSq5rJ5_KXo7pCE9-HpYqAYllg_Td9675H3E31Q'
  secret='8VxNvOkcKn7ibGAQhmI2L8frA7LmdN-IIGXNgmKJ_UxzWTpc487cFLE-vq0yLrXS6-dzL7luNecUyH0elrOA9g'
  cs = CloudStack.Client(api, apikey, secret)
  return cs

def get_users():
  cs = get_cs()
  users = cs.listUsers()
  return users

def get_vms(account_name):
  request = {
    'listall': 'true',
    'state': 'Running',
    'account': account_name
  }

  cs = get_cs()
  vms = cs.listVirtualMachines(request)
  return vms

def get_ip(vm):
  ip = ''
  try:
    ip = vm['publicip']
  except:
    for nic in vm['nic']:
      if nic['type'] == 'Shared':
        ip = nic['ipaddress']

  return ip

def touch_roster_file():
  users = get_users()
  for user in users:
    name = user['account']
    roster_file = '/etc/salt/cloudstack/{0}'.format(name)
    with open(roster_file, 'w') as f:
      vms = get_vms(user['account'])
      for vm in vms:
        ip = get_ip(vm)
        if not ip == '':
          roster = '''
{0}:
  host: {1}
  user: root
  passwd: gdcloud!.2013
'''.format(vm['instancename'], ip)
          f.write(roster)
  
# start here
touch_roster_file()
