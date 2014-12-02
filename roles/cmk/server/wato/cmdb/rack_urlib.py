#!/usr/bin/env python

def get_depots():
  import sys, os
  import pycurl, urllib
  import re, pprint
  import simplejson as json

  _request_uri = 'http://admin:gdcloud.com@racktables/racktables/api.php?method=get_depot'
  http_body = urllib.urlopen(_request_uri).read()
  output = json.loads(http_body)
  objects =  output['response']
  return objects

_properties = ['has_problems', 'comment', 'objtype_id', 'realm', 'name', 'dname', 'atags', 'container_id', 'asset_no', 'label', '8021q_template_id', 'etags', '8021q_domain_id', 'container_name', 'nports', 'itags', 'rack_id', 'id', 'container_objtype_id']

_hosts = get_depots()
for _id, _host in _hosts.items():
    _name = _host['name']
    _tags = "{0}|wato".format(_name)
    if _host['objtype_id'] == '4':
        print _name
#    all_hosts.append(_name)
#    ipaddresses[_name] = _host['ipaddress']
