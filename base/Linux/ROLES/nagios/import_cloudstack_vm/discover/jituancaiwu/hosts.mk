# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-24-2000-VM|Running|wato|/" + FOLDER_PATH + "/",
  "i-24-2001-VM|Running|wato|/" + FOLDER_PATH + "/",
  "i-24-2002-VM|Running|wato|/" + FOLDER_PATH + "/",
  "i-24-2156-VM|Stopped|wato|/" + FOLDER_PATH + "/",
  "i-24-2160-VM|Stopped|wato|/" + FOLDER_PATH + "/",
  "i-24-2164-VM|Stopped|wato|/" + FOLDER_PATH + "/",
  "i-24-2167-VM|Running|wato|/" + FOLDER_PATH + "/",
]


host_contactgroups.append(
  ( ['jituancaiwu'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-24-2000-VM': {'alias': None,
                  'ipaddress': None,
                  'snmp_community': None,
                  'tag_agent': None,
                  'tag_criticality': None,
                  'tag_networking': None,
                  'tag_state': 'Running'},
 'i-24-2001-VM': {'alias': None,
                  'ipaddress': None,
                  'snmp_community': None,
                  'tag_agent': None,
                  'tag_criticality': None,
                  'tag_networking': None,
                  'tag_state': 'Running'},
 'i-24-2002-VM': {'alias': None,
                  'ipaddress': None,
                  'snmp_community': None,
                  'tag_agent': None,
                  'tag_criticality': None,
                  'tag_networking': None,
                  'tag_state': 'Running'},
 'i-24-2156-VM': {'alias': None,
                  'ipaddress': None,
                  'snmp_community': None,
                  'tag_agent': None,
                  'tag_criticality': None,
                  'tag_networking': None,
                  'tag_state': 'Stopped'},
 'i-24-2160-VM': {'alias': None,
                  'ipaddress': None,
                  'snmp_community': None,
                  'tag_agent': None,
                  'tag_criticality': None,
                  'tag_networking': None,
                  'tag_state': 'Stopped'},
 'i-24-2164-VM': {'alias': None,
                  'ipaddress': None,
                  'snmp_community': None,
                  'tag_agent': None,
                  'tag_criticality': None,
                  'tag_networking': None,
                  'tag_state': 'Stopped'},
 'i-24-2167-VM': {'alias': None,
                  'ipaddress': None,
                  'snmp_community': None,
                  'tag_agent': None,
                  'tag_criticality': None,
                  'tag_networking': None,
                  'tag_state': 'Running'}})
