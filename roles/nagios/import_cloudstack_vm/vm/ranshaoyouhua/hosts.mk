# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-13-1270-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-13-1937-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-13-1938-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-13-1939-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-13-2171-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
]


# Settings for alias
extra_host_conf.setdefault('alias', []).extend(
  [(u'RSYHCLOUD3', ['i-13-1938-VM']),
 (u'RSYHCLOUD2', ['i-13-1937-VM']),
 (u'RSYHCLOUD4', ['i-13-1939-VM']),
 (u'RSYHCLOUD5', ['i-13-2171-VM']),
 (u'ranshaoyouhua', ['i-13-1270-VM'])])

# Settings for parents
extra_host_conf.setdefault('parents', []).extend(
  [('access-sw01,access-sw02', ['i-13-1938-VM']),
 ('access-sw01,access-sw02', ['i-13-1937-VM']),
 ('access-sw01,access-sw02', ['i-13-1939-VM']),
 ('access-sw01,access-sw02', ['i-13-2171-VM']),
 ('access-sw01,access-sw02', ['i-13-1270-VM'])])

host_contactgroups.append(
  ( ['ranshaoyouhua'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-13-1270-VM': {'alias': u'ranshaoyouhua', 'tag_state': 'Running'},
 'i-13-1937-VM': {'alias': u'RSYHCLOUD2', 'tag_state': 'Running'},
 'i-13-1938-VM': {'alias': u'RSYHCLOUD3', 'tag_state': 'Running'},
 'i-13-1939-VM': {'alias': u'RSYHCLOUD4', 'tag_state': 'Running'},
 'i-13-2171-VM': {'alias': u'RSYHCLOUD5', 'tag_state': 'Running'}})
