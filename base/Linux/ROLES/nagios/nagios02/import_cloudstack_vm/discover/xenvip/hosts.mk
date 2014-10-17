# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-17-1503-VM|Running|wato|/" + FOLDER_PATH + "/",
  "i-17-1715-VM|Running|wato|/" + FOLDER_PATH + "/",
  "i-17-1832-VM|Stopped|wato|/" + FOLDER_PATH + "/",
  "i-17-1838-VM|Stopped|wato|/" + FOLDER_PATH + "/",
  "i-17-1976-VM|Running|wato|/" + FOLDER_PATH + "/",
  "i-17-2157-VM|Running|wato|/" + FOLDER_PATH + "/",
  "i-17-2158-VM|Running|wato|/" + FOLDER_PATH + "/",
]


host_contactgroups.append(
  ( ['xenvip'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-17-1503-VM': {'alias': None,
                  'ipaddress': None,
                  'snmp_community': None,
                  'tag_agent': None,
                  'tag_criticality': None,
                  'tag_networking': None,
                  'tag_state': 'Running'},
 'i-17-1715-VM': {'alias': None,
                  'ipaddress': None,
                  'snmp_community': None,
                  'tag_agent': None,
                  'tag_criticality': None,
                  'tag_networking': None,
                  'tag_state': 'Running'},
 'i-17-1832-VM': {'alias': None,
                  'ipaddress': None,
                  'snmp_community': None,
                  'tag_agent': None,
                  'tag_criticality': None,
                  'tag_networking': None,
                  'tag_state': 'Stopped'},
 'i-17-1838-VM': {'alias': None,
                  'ipaddress': None,
                  'snmp_community': None,
                  'tag_agent': None,
                  'tag_criticality': None,
                  'tag_networking': None,
                  'tag_state': 'Stopped'},
 'i-17-1976-VM': {'alias': None,
                  'ipaddress': None,
                  'snmp_community': None,
                  'tag_agent': None,
                  'tag_criticality': None,
                  'tag_networking': None,
                  'tag_state': 'Running'},
 'i-17-2157-VM': {'alias': None,
                  'ipaddress': None,
                  'snmp_community': None,
                  'tag_agent': None,
                  'tag_criticality': None,
                  'tag_networking': None,
                  'tag_state': 'Running'},
 'i-17-2158-VM': {'alias': None,
                  'ipaddress': None,
                  'snmp_community': None,
                  'tag_agent': None,
                  'tag_criticality': None,
                  'tag_networking': None,
                  'tag_state': 'Running'}})
