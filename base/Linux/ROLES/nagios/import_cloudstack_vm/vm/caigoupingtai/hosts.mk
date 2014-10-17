# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-22-1888-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-22-1890-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-22-1891-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-22-1892-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-22-1893-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-22-1894-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-22-1895-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-22-1947-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-22-1948-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-22-1949-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-22-2153-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-22-2154-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
]


# Settings for alias
extra_host_conf.setdefault('alias', []).extend(
  [(u'KHDOC1', ['i-22-1948-VM']),
 (u'EPP', ['i-22-1893-VM']),
 (u'WFP', ['i-22-1892-VM']),
 (u'PRD', ['i-22-1888-VM']),
 (u'WDP', ['i-22-1894-VM']),
 (u'KHDOC2', ['i-22-1949-VM']),
 (u'OSP', ['i-22-1895-VM']),
 (u'PIP', ['i-22-1891-VM']),
 (u'ERPWD1', ['i-22-2153-VM']),
 (u'ERPWD2', ['i-22-2154-VM']),
 (u'GDSXMIS', ['i-22-1947-VM']),
 (u'SRP', ['i-22-1890-VM'])])

# Settings for parents
extra_host_conf.setdefault('parents', []).extend(
  [('access-sw01,access-sw02', ['i-22-1948-VM']),
 ('access-sw01,access-sw02', ['i-22-1893-VM']),
 ('access-sw01,access-sw02', ['i-22-1892-VM']),
 ('access-sw01,access-sw02', ['i-22-1888-VM']),
 ('access-sw01,access-sw02', ['i-22-1894-VM']),
 ('access-sw01,access-sw02', ['i-22-1949-VM']),
 ('access-sw01,access-sw02', ['i-22-1895-VM']),
 ('access-sw01,access-sw02', ['i-22-1891-VM']),
 ('access-sw01,access-sw02', ['i-22-2153-VM']),
 ('access-sw01,access-sw02', ['i-22-2154-VM']),
 ('access-sw01,access-sw02', ['i-22-1947-VM']),
 ('access-sw01,access-sw02', ['i-22-1890-VM'])])

host_contactgroups.append(
  ( ['caigoupingtai'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-22-1888-VM': {'alias': u'PRD', 'tag_state': 'Running'},
 'i-22-1890-VM': {'alias': u'SRP', 'tag_state': 'Running'},
 'i-22-1891-VM': {'alias': u'PIP', 'tag_state': 'Running'},
 'i-22-1892-VM': {'alias': u'WFP', 'tag_state': 'Running'},
 'i-22-1893-VM': {'alias': u'EPP', 'tag_state': 'Running'},
 'i-22-1894-VM': {'alias': u'WDP', 'tag_state': 'Running'},
 'i-22-1895-VM': {'alias': u'OSP', 'tag_state': 'Running'},
 'i-22-1947-VM': {'alias': u'GDSXMIS', 'tag_state': 'Running'},
 'i-22-1948-VM': {'alias': u'KHDOC1', 'tag_state': 'Running'},
 'i-22-1949-VM': {'alias': u'KHDOC2', 'tag_state': 'Running'},
 'i-22-2153-VM': {'alias': u'ERPWD1', 'tag_state': 'Running'},
 'i-22-2154-VM': {'alias': u'ERPWD2', 'tag_state': 'Running'}})
