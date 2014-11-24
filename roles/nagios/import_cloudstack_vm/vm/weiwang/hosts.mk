# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-6-128-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
  "i-6-129-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-6-131-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-6-133-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
  "i-6-134-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
  "i-6-135-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
  "i-6-136-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
  "i-6-137-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
]


# Settings for alias
extra_host_conf.setdefault('alias', []).extend(
  [(u'weiwang-Config', ['i-6-133-VM']),
 (u'weiwang-Alarm', ['i-6-135-VM']),
 (u'weiwang-IOServer', ['i-6-131-VM']),
 (u'weiwang-HistoryDB', ['i-6-134-VM']),
 (u'weiwang-Picture', ['i-6-129-VM']),
 (u'weiwang-RealDB', ['i-6-128-VM']),
 (u'weiwang-VeStoreDB', ['i-6-136-VM']),
 (u'weiwang-HMI', ['i-6-137-VM'])])

# Settings for parents
extra_host_conf.setdefault('parents', []).extend(
  [('access-sw01,access-sw02', ['i-6-133-VM']),
 ('access-sw01,access-sw02', ['i-6-135-VM']),
 ('access-sw01,access-sw02', ['i-6-131-VM']),
 ('access-sw01,access-sw02', ['i-6-134-VM']),
 ('access-sw01,access-sw02', ['i-6-129-VM']),
 ('access-sw01,access-sw02', ['i-6-128-VM']),
 ('access-sw01,access-sw02', ['i-6-136-VM']),
 ('access-sw01,access-sw02', ['i-6-137-VM'])])

host_contactgroups.append(
  ( ['weiwang'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-6-128-VM': {'alias': u'weiwang-RealDB', 'tag_state': 'Stopped'},
 'i-6-129-VM': {'alias': u'weiwang-Picture', 'tag_state': 'Running'},
 'i-6-131-VM': {'alias': u'weiwang-IOServer', 'tag_state': 'Running'},
 'i-6-133-VM': {'alias': u'weiwang-Config', 'tag_state': 'Stopped'},
 'i-6-134-VM': {'alias': u'weiwang-HistoryDB', 'tag_state': 'Stopped'},
 'i-6-135-VM': {'alias': u'weiwang-Alarm', 'tag_state': 'Stopped'},
 'i-6-136-VM': {'alias': u'weiwang-VeStoreDB', 'tag_state': 'Stopped'},
 'i-6-137-VM': {'alias': u'weiwang-HMI', 'tag_state': 'Running'}})
