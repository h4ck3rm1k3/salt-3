# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-9-1944-VM|Running|wato|/" + FOLDER_PATH + "/",
  "i-9-1945-VM|Running|wato|/" + FOLDER_PATH + "/",
  "i-9-1953-VM|Running|wato|/" + FOLDER_PATH + "/",
  "i-9-1954-VM|Stopped|wato|/" + FOLDER_PATH + "/",
  "i-9-1955-VM|Running|wato|/" + FOLDER_PATH + "/",
]


host_contactgroups.append(
  ( ['jituanmenhu'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-9-1944-VM': {'alias': None,
                 'ipaddress': None,
                 'snmp_community': None,
                 'tag_agent': None,
                 'tag_criticality': None,
                 'tag_networking': None,
                 'tag_state': 'Running'},
 'i-9-1945-VM': {'alias': None,
                 'ipaddress': None,
                 'snmp_community': None,
                 'tag_agent': None,
                 'tag_criticality': None,
                 'tag_networking': None,
                 'tag_state': 'Running'},
 'i-9-1953-VM': {'alias': None,
                 'ipaddress': None,
                 'snmp_community': None,
                 'tag_agent': None,
                 'tag_criticality': None,
                 'tag_networking': None,
                 'tag_state': 'Running'},
 'i-9-1954-VM': {'alias': None,
                 'ipaddress': None,
                 'snmp_community': None,
                 'tag_agent': None,
                 'tag_criticality': None,
                 'tag_networking': None,
                 'tag_state': 'Stopped'},
 'i-9-1955-VM': {'alias': None,
                 'ipaddress': None,
                 'snmp_community': None,
                 'tag_agent': None,
                 'tag_criticality': None,
                 'tag_networking': None,
                 'tag_state': 'Running'}})
