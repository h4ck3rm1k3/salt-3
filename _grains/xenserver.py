def xs_host():
  import sys
  sys.path.append('/usr/lib/python2.4/site-packages/')
  import XenAPI, inventory
  import pprint

  session = XenAPI.xapi_local()
  uuid = inventory.get_localhost_uuid()
  session.xenapi.login_with_password('', '')
  this_host = session.xenapi.host.get_by_uuid(uuid)
  hosts = session.xenapi.host.get_all_records()

  grains = {}
  grains['xs_host'] = hosts[this_host]
  grains['xs_pool'] = session.xenapi.pool.get_all_records()
  session.xenapi.logout()
  return grains
