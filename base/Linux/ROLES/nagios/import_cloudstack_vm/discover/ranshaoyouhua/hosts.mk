# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-13-1270-VM|Running|wato|/" + FOLDER_PATH + "/",
  "i-13-1937-VM|Running|wato|/" + FOLDER_PATH + "/",
  "i-13-1938-VM|Running|wato|/" + FOLDER_PATH + "/",
  "i-13-1939-VM|Running|wato|/" + FOLDER_PATH + "/",
  "i-13-2171-VM|Running|wato|/" + FOLDER_PATH + "/",
]


host_contactgroups.append(
  ( ['ranshaoyouhua'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-13-1270-VM': {'alias': None,
                  'ipaddress': None,
                  'snmp_community': None,
                  'tag_agent': None,
                  'tag_criticality': None,
                  'tag_networking': None,
                  'tag_state': 'Running'},
 'i-13-1937-VM': {'alias': None,
                  'ipaddress': None,
                  'snmp_community': None,
                  'tag_agent': None,
                  'tag_criticality': None,
                  'tag_networking': None,
                  'tag_state': 'Running'},
 'i-13-1938-VM': {'alias': None,
                  'ipaddress': None,
                  'snmp_community': None,
                  'tag_agent': None,
                  'tag_criticality': None,
                  'tag_networking': None,
                  'tag_state': 'Running'},
 'i-13-1939-VM': {'alias': None,
                  'ipaddress': None,
                  'snmp_community': None,
                  'tag_agent': None,
                  'tag_criticality': None,
                  'tag_networking': None,
                  'tag_state': 'Running'},
 'i-13-2171-VM': {'alias': None,
                  'ipaddress': None,
                  'snmp_community': None,
                  'tag_agent': None,
                  'tag_criticality': None,
                  'tag_networking': None,
                  'tag_state': 'Running'}})
