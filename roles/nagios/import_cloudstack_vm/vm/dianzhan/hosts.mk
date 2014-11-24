# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-19-1817-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-19-1831-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
  "i-19-1973-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
  "i-19-1980-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-19-1981-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-19-1982-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-19-2151-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-19-2161-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
]


# Settings for alias
extra_host_conf.setdefault('alias', []).extend(
  [(u'stoptmp-HD-WEB', ['i-19-1831-VM']),
 (u'Taian-OA', ['i-19-2151-VM']),
 (u'HD-TREN', ['i-19-1817-VM']),
 (u'Taian-Mis', ['i-19-1981-VM']),
 (u'HD-web', ['i-19-2161-VM']),
 (u'(no)rtsystem-win7', ['i-19-1973-VM']),
 (u'Taian-oracle', ['i-19-1980-VM']),
 (u'Taian-p6', ['i-19-1982-VM'])])

# Settings for parents
extra_host_conf.setdefault('parents', []).extend(
  [('access-sw01,access-sw02', ['i-19-1831-VM']),
 ('access-sw01,access-sw02', ['i-19-2151-VM']),
 ('access-sw01,access-sw02', ['i-19-1817-VM']),
 ('access-sw01,access-sw02', ['i-19-1981-VM']),
 ('access-sw01,access-sw02', ['i-19-2161-VM']),
 ('access-sw01,access-sw02', ['i-19-1973-VM']),
 ('access-sw01,access-sw02', ['i-19-1980-VM']),
 ('access-sw01,access-sw02', ['i-19-1982-VM'])])

host_contactgroups.append(
  ( ['dianzhan'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-19-1817-VM': {'alias': u'HD-TREN', 'tag_state': 'Running'},
 'i-19-1831-VM': {'alias': u'stoptmp-HD-WEB', 'tag_state': 'Stopped'},
 'i-19-1973-VM': {'alias': u'(no)rtsystem-win7', 'tag_state': 'Stopped'},
 'i-19-1980-VM': {'alias': u'Taian-oracle', 'tag_state': 'Running'},
 'i-19-1981-VM': {'alias': u'Taian-Mis', 'tag_state': 'Running'},
 'i-19-1982-VM': {'alias': u'Taian-p6', 'tag_state': 'Running'},
 'i-19-2151-VM': {'alias': u'Taian-OA', 'tag_state': 'Running'},
 'i-19-2161-VM': {'alias': u'HD-web', 'tag_state': 'Running'}})
