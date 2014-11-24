# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-10-1722-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-10-1747-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-10-1748-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-10-1807-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-10-1952-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-10-2173-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
]


# Settings for alias
extra_host_conf.setdefault('alias', []).extend(
  [(u'tianren-vote', ['i-10-2173-VM']),
 (u'tianren-web-db-is', ['i-10-1748-VM']),
 (u'webportal', ['i-10-1807-VM']),
 (u'TRneiwang-web', ['i-10-1952-VM']),
 (u'tianren-web-is', ['i-10-1747-VM']),
 (u'tianren-forum', ['i-10-1722-VM'])])

# Settings for parents
extra_host_conf.setdefault('parents', []).extend(
  [('access-sw01,access-sw02', ['i-10-2173-VM']),
 ('access-sw01,access-sw02', ['i-10-1748-VM']),
 ('access-sw01,access-sw02', ['i-10-1807-VM']),
 ('access-sw01,access-sw02', ['i-10-1952-VM']),
 ('access-sw01,access-sw02', ['i-10-1747-VM']),
 ('access-sw01,access-sw02', ['i-10-1722-VM'])])

host_contactgroups.append(
  ( ['dangyuanzhijia'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-10-1722-VM': {'alias': u'tianren-forum', 'tag_state': 'Running'},
 'i-10-1747-VM': {'alias': u'tianren-web-is', 'tag_state': 'Running'},
 'i-10-1748-VM': {'alias': u'tianren-web-db-is', 'tag_state': 'Running'},
 'i-10-1807-VM': {'alias': u'webportal', 'tag_state': 'Running'},
 'i-10-1952-VM': {'alias': u'TRneiwang-web', 'tag_state': 'Running'},
 'i-10-2173-VM': {'alias': u'tianren-vote', 'tag_state': 'Running'}})
