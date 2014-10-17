# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-25-1988-VM|Running|wato|/" + FOLDER_PATH + "/",
]


host_contactgroups.append(
  ( ['jtcaiwuback'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-25-1988-VM': {'alias': None,
                  'ipaddress': None,
                  'snmp_community': None,
                  'tag_agent': None,
                  'tag_criticality': None,
                  'tag_networking': None,
                  'tag_state': 'Running'}})
