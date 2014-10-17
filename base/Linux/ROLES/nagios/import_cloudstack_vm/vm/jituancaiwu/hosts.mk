# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-24-2000-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-24-2001-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-24-2002-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-24-2156-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
  "i-24-2160-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
  "i-24-2164-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
  "i-24-2167-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
]


# Settings for alias
extra_host_conf.setdefault('alias', []).extend(
  [(u'caiwu-test1', ['i-24-2156-VM']),
 (u'caiwuapp-1', ['i-24-2000-VM']),
 (u'caiwuApp-3', ['i-24-2002-VM']),
 (u'caiwu-test02', ['i-24-2160-VM']),
 (u'caiwu-app01-win2008', ['i-24-2167-VM']),
 (u'caiwuapp-2', ['i-24-2001-VM']),
 (u'caiwu-test03', ['i-24-2164-VM'])])

# Settings for parents
extra_host_conf.setdefault('parents', []).extend(
  [('access-sw01,access-sw02', ['i-24-2156-VM']),
 ('access-sw01,access-sw02', ['i-24-2000-VM']),
 ('access-sw01,access-sw02', ['i-24-2002-VM']),
 ('access-sw01,access-sw02', ['i-24-2160-VM']),
 ('access-sw01,access-sw02', ['i-24-2167-VM']),
 ('access-sw01,access-sw02', ['i-24-2001-VM']),
 ('access-sw01,access-sw02', ['i-24-2164-VM'])])

host_contactgroups.append(
  ( ['jituancaiwu'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-24-2000-VM': {'alias': u'caiwuapp-1', 'tag_state': 'Running'},
 'i-24-2001-VM': {'alias': u'caiwuapp-2', 'tag_state': 'Running'},
 'i-24-2002-VM': {'alias': u'caiwuApp-3', 'tag_state': 'Running'},
 'i-24-2156-VM': {'alias': u'caiwu-test1', 'tag_state': 'Stopped'},
 'i-24-2160-VM': {'alias': u'caiwu-test02', 'tag_state': 'Stopped'},
 'i-24-2164-VM': {'alias': u'caiwu-test03', 'tag_state': 'Stopped'},
 'i-24-2167-VM': {'alias': u'caiwu-app01-win2008', 'tag_state': 'Running'}})
