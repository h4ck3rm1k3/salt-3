# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-16-1706-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
  "i-16-1709-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
  "i-16-1777-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-16-1819-VM|Running|up|wato|/" + FOLDER_PATH + "/",
]


# Settings for alias
extra_host_conf.setdefault('alias', []).extend(
  [(u'oarelease-is', ['i-16-1777-VM']),
 (u'(no)jituanmis-is3', ['i-16-1709-VM']),
 (u'(no)Jituanmis1-xs', ['i-16-1706-VM'])])

# Settings for parents
extra_host_conf.setdefault('parents', []).extend(
  [('access-sw01,access-sw02', ['i-16-1777-VM']),
 ('access-sw01,access-sw02', ['i-16-1709-VM']),
 ('access-sw01,access-sw02', ['i-16-1706-VM']),
 ('access-sw01,access-sw02', ['i-16-1819-VM'])])

host_contactgroups.append(
  ( ['jituanoamis'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-16-1706-VM': {'alias': u'(no)Jituanmis1-xs', 'tag_state': 'Stopped'},
 'i-16-1709-VM': {'alias': u'(no)jituanmis-is3', 'tag_state': 'Stopped'},
 'i-16-1777-VM': {'alias': u'oarelease-is', 'tag_state': 'Running'},
 'i-16-1819-VM': {'alias': None,
                  'ipaddress': None,
                  'snmp_community': None,
                  'tag_agent': None,
                  'tag_criticality': None,
                  'tag_networking': None,
                  'tag_port_tcp': None,
                  'tag_state': 'Running'}})
