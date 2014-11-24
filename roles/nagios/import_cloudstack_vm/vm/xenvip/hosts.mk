# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-17-1503-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-17-1715-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-17-1832-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
  "i-17-1838-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
  "i-17-1976-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-17-2157-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-17-2158-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
]


# Settings for alias
extra_host_conf.setdefault('alias', []).extend(
  [(u'email', ['i-17-1715-VM']),
 (u'GDUPC-ftpserver-vip', ['i-17-1503-VM']),
 (u'stop-tmp-DC2', ['i-17-1838-VM']),
 (u'nano-techweb', ['i-17-1976-VM']),
 (u'stop-tmp-AD', ['i-17-1832-VM']),
 (u'hdtr-dangan-fileserver', ['i-17-2157-VM']),
 (u'hdtr-dangan-orcaledb', ['i-17-2158-VM'])])

# Settings for parents
extra_host_conf.setdefault('parents', []).extend(
  [('access-sw01,access-sw02', ['i-17-1715-VM']),
 ('access-sw01,access-sw02', ['i-17-1503-VM']),
 ('access-sw01,access-sw02', ['i-17-1838-VM']),
 ('access-sw01,access-sw02', ['i-17-1976-VM']),
 ('access-sw01,access-sw02', ['i-17-1832-VM']),
 ('access-sw01,access-sw02', ['i-17-2157-VM']),
 ('access-sw01,access-sw02', ['i-17-2158-VM'])])

host_contactgroups.append(
  ( ['xenvip'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-17-1503-VM': {'alias': u'GDUPC-ftpserver-vip', 'tag_state': 'Running'},
 'i-17-1715-VM': {'alias': u'email', 'tag_state': 'Running'},
 'i-17-1832-VM': {'alias': u'stop-tmp-AD', 'tag_state': 'Stopped'},
 'i-17-1838-VM': {'alias': u'stop-tmp-DC2', 'tag_state': 'Stopped'},
 'i-17-1976-VM': {'alias': u'nano-techweb', 'tag_state': 'Running'},
 'i-17-2157-VM': {'alias': u'hdtr-dangan-fileserver', 'tag_state': 'Running'},
 'i-17-2158-VM': {'alias': u'hdtr-dangan-orcaledb', 'tag_state': 'Running'}})
