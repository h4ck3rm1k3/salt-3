# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-14-1776-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
  "i-14-1806-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-14-1808-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-14-1809-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-14-1812-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-14-1813-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-14-1814-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-14-1815-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-14-1816-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-14-1841-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-14-1845-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-14-1846-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-14-1862-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-14-1865-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-14-1866-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
]


# Settings for alias
extra_host_conf.setdefault('alias', []).extend(
  [(u'SAPSD', ['i-14-1808-VM']),
 (u'EPC-DEMO', ['i-14-1841-VM']),
 (u'SAPIDES', ['i-14-1806-VM']),
 (u'EPT', ['i-14-1865-VM']),
 (u'no-is-SVN', ['i-14-1776-VM']),
 (u'SAPPI', ['i-14-1812-VM']),
 (u'SRMQAS', ['i-14-1846-VM']),
 (u'SAPSRMT', ['i-14-1813-VM']),
 (u'saped', ['i-14-1809-VM']),
 (u'SAPPT', ['i-14-1815-VM']),
 (u'ERPQAS', ['i-14-1845-VM']),
 (u'SAPPIT', ['i-14-1816-VM']),
 (u'SAPERPT', ['i-14-1814-VM']),
 (u'PIQ', ['i-14-1866-VM']),
 (u'ERP01', ['i-14-1862-VM'])])

# Settings for parents
extra_host_conf.setdefault('parents', []).extend(
  [('access-sw01,access-sw02', ['i-14-1808-VM']),
 ('access-sw01,access-sw02', ['i-14-1841-VM']),
 ('access-sw01,access-sw02', ['i-14-1806-VM']),
 ('access-sw01,access-sw02', ['i-14-1865-VM']),
 ('access-sw01,access-sw02', ['i-14-1776-VM']),
 ('access-sw01,access-sw02', ['i-14-1812-VM']),
 ('access-sw01,access-sw02', ['i-14-1846-VM']),
 ('access-sw01,access-sw02', ['i-14-1813-VM']),
 ('access-sw01,access-sw02', ['i-14-1809-VM']),
 ('access-sw01,access-sw02', ['i-14-1815-VM']),
 ('access-sw01,access-sw02', ['i-14-1845-VM']),
 ('access-sw01,access-sw02', ['i-14-1816-VM']),
 ('access-sw01,access-sw02', ['i-14-1814-VM']),
 ('access-sw01,access-sw02', ['i-14-1866-VM']),
 ('access-sw01,access-sw02', ['i-14-1862-VM'])])

host_contactgroups.append(
  ( ['erp'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-14-1776-VM': {'alias': u'no-is-SVN', 'tag_state': 'Stopped'},
 'i-14-1806-VM': {'alias': u'SAPIDES', 'tag_state': 'Running'},
 'i-14-1808-VM': {'alias': u'SAPSD', 'tag_state': 'Running'},
 'i-14-1809-VM': {'alias': u'saped', 'tag_state': 'Running'},
 'i-14-1812-VM': {'alias': u'SAPPI', 'tag_state': 'Running'},
 'i-14-1813-VM': {'alias': u'SAPSRMT', 'tag_state': 'Running'},
 'i-14-1814-VM': {'alias': u'SAPERPT', 'tag_state': 'Running'},
 'i-14-1815-VM': {'alias': u'SAPPT', 'tag_state': 'Running'},
 'i-14-1816-VM': {'alias': u'SAPPIT', 'tag_state': 'Running'},
 'i-14-1841-VM': {'alias': u'EPC-DEMO', 'tag_state': 'Running'},
 'i-14-1845-VM': {'alias': u'ERPQAS', 'tag_state': 'Running'},
 'i-14-1846-VM': {'alias': u'SRMQAS', 'tag_state': 'Running'},
 'i-14-1862-VM': {'alias': u'ERP01', 'tag_state': 'Running'},
 'i-14-1865-VM': {'alias': u'EPT', 'tag_state': 'Running'},
 'i-14-1866-VM': {'alias': u'PIQ', 'tag_state': 'Running'}})
