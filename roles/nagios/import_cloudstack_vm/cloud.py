#!/usr/bin/python
# coding: utf-8
import CloudStack, pprint, os, sys
import argparse, datetime
import commands

#parser = argparse.ArgumentParser()
#parser.add_argument("-d", type=str, choices=('/tmp', '/tmp/vm'), nargs=1, action='store', dest='dst_dir', help="default wato_vm root folder")
#args = parser.parse_args()
#print args.dst_dir

mhost = {
  'api': 'http://csm01:8080/client/api',
  'apikey': 'f0Q70X5oTpax-b7bvyzDQf2t_rKaK0rWkLXhejPRqI4i6IgiSq5rJ5_KXo7pCE9-HpYqAYllg_Td9675H3E31Q',
  'secret': '8VxNvOkcKn7ibGAQhmI2L8frA7LmdN-IIGXNgmKJ_UxzWTpc487cFLE-vq0yLrXS6-dzL7luNecUyH0elrOA9g',
}
cs = CloudStack.Client(mhost['api'], mhost['apikey'], mhost['secret'])

def get_domains():
  domains = cs.listDomains()
  return domains

hosts = []
routers = []
sysvms = []
settings = []
events = []
alerts = []
zones = []

def get_accounts():
  accounts = []
  domains = get_domains()
  for domain in domains:
    accounts += cs.listAccounts({'domainid': domain['id']})
  return accounts

def get_zones():
  domains = get_domains()
  for domain in domains:
    zones += cs.listZones({'domainid': domain['id']})
  return zones

def get_cg():
  accounts = get_accounts()
  for account in accounts:
    cg_name = account['name']
    cg_alias = account['name']
    cg = "define_contactgroups.update({'%s': u'%s'})" % (cg_name, cg_alias )
    hg = "define_contactgroups.update({'%s': u'%s'})" % (cg_name, cg_alias )
    print cg

def get_hg():
  accounts = get_accounts()
  for account in accounts:
    hg_name = account['name']
    hg_alias = account['name']
    hg = "define_hostgroups.update({'%s': u'%s'})" % (hg_name, hg_alias )
    print hg

def get_cs_vms():
  accounts = get_accounts()
  cs_vms = []
  for account in accounts:
    cs_vms += cs.listVirtualMachines({'account': account['name']})
  return cs_vms

def is_nagios_host(hostname):
  socket_path = "/omd/sites/cloud/tmp/run/live"
  import socket
  s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
  s.connect(socket_path)
  LQL = "GET hosts\nColumns: name\nFilter: name = %s" % hostname
  s.send(LQL)
  s.shutdown(socket.SHUT_WR)
  answer = s.recv(100000000)
  print LQL
  print len(answer)
  if len(answer.split('\n')):
    return True
  else:
    return False

def is_wato_host(hostname):
  return hostname

def get_hosts_mk_files():
  cmd = "find ~/etc/check_mk/conf.d/wato/ -iname 'hosts.mk'"
  hosts_mk_files = commands.getoutput(cmd)
  return hosts_mk_files

def read_hosts_mk(file):
  global all_hosts, extra_host_conf, host_attributes, host_contactgroups
  all_hosts = []
  FOLDER_PATH = file
  ALL_HOSTS = all_hosts
  extra_host_conf = {}
  host_attributes = {}
  host_contactgroups = []
  execfile(file)
  print all_hosts

def add_wato_host(vm):
  if not is_wato_host(vm) and vm['state'] == 'Running':
#    host_folder = '/omd/sites/cloud/etc/check_mk/conf.d/wato/vm' + '/' + account_name
    host_folder = '/tmp/vm' + '/' + vm['account']

    if not os.path.exists(host_folder):
      print host_folder + "not exists! create it..."
      os.makedirs(host_folder)
    else:
      print host_folder + "ok, exists"

    host_mk = host_folder + '/hosts.mk'
    hostname =  vm['instancename']
    alias =  vm['displayname']

    tags = []
    tags +=  [vm['state']]
    tags = '|'.join(tags)

    host_path = 'all_hosts += ["%s|wato|%s|/" + FOLDER_PATH + "/",]\n' % (hostname, tags)
    host_conf = "extra_host_conf.setdefault('alias', []).extend([(u'%s', ['%s'])])\n" % (alias, hostname)
    host_attr = "host_attributes.update({'%s': {'alias': u'%s', 'tag_state': '%s'}})\n" % (hostname, alias, tags)

    now = datetime.datetime.now()
    timestamp = now.strftime("%Y-%m-%d_%H-%M-%S")
    log = "###%s %s###\n" % (hostname ,timestamp) 
    print log
'''
    with open(host_mk, 'a+') as f:
      f.write(log)
      f.write(host_path)
      f.write(host_conf)
      f.write(host_attr)
      f.write("\n")
'''

def write_dns():
  dns_conf = '/tmp/vm/dns_conf.log'
  new_hosts = get_new_hosts()
  with open(dns_conf, 'a') as f_dns:
    for vm in new_hosts:
      if vm['state'] == 'Running':
        hostname =  vm['instancename']
        try:
          ipaddr =  vm['publicip']
          dns = "%s %s\n" % (ipaddr, hostname)
          f_dns.write(dns)
          f_dns.write('\n')
        except:
          pass

#write_dns()
#for vm in get_cs_vms():
#  hostname = vm['instancename']
#  print hostname
#  if not is_wato_host(hostname):
#    print hostname
read_hosts_mk('/omd/sites/cloud/etc/check_mk/conf.d/wato/vm/erp/hosts.mk')
