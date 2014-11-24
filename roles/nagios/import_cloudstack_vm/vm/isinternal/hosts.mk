# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-18-1737-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
  "i-18-1778-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
  "i-18-1828-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-18-1829-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-18-1834-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
  "i-18-1836-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
  "i-18-1840-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-18-1844-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-18-1852-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-18-1853-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-18-1860-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-18-1861-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-18-1870-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-18-1877-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
  "i-18-1956-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-18-2003-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
]


# Settings for alias
extra_host_conf.setdefault('alias', []).extend(
  [(u'QAS', ['i-18-1860-VM']),
 (u'ERP-HCM-DEV', ['i-18-1829-VM']),
 (u'(no )jijianmis-xs', ['i-18-1956-VM']),
 (u'(no)win7-2', ['i-18-1834-VM']),
 (u'ERPR3LOAD2', ['i-18-2003-VM']),
 (u'(no)win7-1', ['i-18-1836-VM']),
 (u'SAPHCMT', ['i-18-1840-VM']),
 (u'SAPBO', ['i-18-1852-VM']),
 (u'(tetst)mobilOA', ['i-18-1778-VM']),
 (u'GDHR-EP', ['i-18-1844-VM']),
 (u'stoptmp-depmanage', ['i-18-1737-VM']),
 (u'filemanage', ['i-18-1828-VM']),
 (u'EPT', ['i-18-1861-VM']),
 (u'EPT4WIN', ['i-18-1870-VM']),
 (u'SAPBW', ['i-18-1853-VM']),
 (u'(no)mis-hamijijian', ['i-18-1877-VM'])])

# Settings for parents
extra_host_conf.setdefault('parents', []).extend(
  [('access-sw01,access-sw02', ['i-18-1860-VM']),
 ('access-sw01,access-sw02', ['i-18-1829-VM']),
 ('access-sw01,access-sw02', ['i-18-1956-VM']),
 ('access-sw01,access-sw02', ['i-18-1834-VM']),
 ('access-sw01,access-sw02', ['i-18-2003-VM']),
 ('access-sw01,access-sw02', ['i-18-1836-VM']),
 ('access-sw01,access-sw02', ['i-18-1840-VM']),
 ('access-sw01,access-sw02', ['i-18-1852-VM']),
 ('access-sw01,access-sw02', ['i-18-1778-VM']),
 ('access-sw01,access-sw02', ['i-18-1844-VM']),
 ('access-sw01,access-sw02', ['i-18-1737-VM']),
 ('access-sw01,access-sw02', ['i-18-1828-VM']),
 ('access-sw01,access-sw02', ['i-18-1861-VM']),
 ('access-sw01,access-sw02', ['i-18-1870-VM']),
 ('access-sw01,access-sw02', ['i-18-1853-VM']),
 ('access-sw01,access-sw02', ['i-18-1877-VM'])])

host_contactgroups.append(
  ( ['isinternal'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-18-1737-VM': {'alias': u'stoptmp-depmanage', 'tag_state': 'Stopped'},
 'i-18-1778-VM': {'alias': u'(tetst)mobilOA', 'tag_state': 'Stopped'},
 'i-18-1828-VM': {'alias': u'filemanage', 'tag_state': 'Running'},
 'i-18-1829-VM': {'alias': u'ERP-HCM-DEV', 'tag_state': 'Running'},
 'i-18-1834-VM': {'alias': u'(no)win7-2', 'tag_state': 'Stopped'},
 'i-18-1836-VM': {'alias': u'(no)win7-1', 'tag_state': 'Stopped'},
 'i-18-1840-VM': {'alias': u'SAPHCMT', 'tag_state': 'Running'},
 'i-18-1844-VM': {'alias': u'GDHR-EP', 'tag_state': 'Running'},
 'i-18-1852-VM': {'alias': u'SAPBO', 'tag_state': 'Running'},
 'i-18-1853-VM': {'alias': u'SAPBW', 'tag_state': 'Running'},
 'i-18-1860-VM': {'alias': u'QAS', 'tag_state': 'Running'},
 'i-18-1861-VM': {'alias': u'EPT', 'tag_state': 'Running'},
 'i-18-1870-VM': {'alias': u'EPT4WIN', 'tag_state': 'Running'},
 'i-18-1877-VM': {'alias': u'(no)mis-hamijijian', 'tag_state': 'Stopped'},
 'i-18-1956-VM': {'alias': u'(no )jijianmis-xs', 'tag_state': 'Running'},
 'i-18-2003-VM': {'alias': u'ERPR3LOAD2', 'tag_state': 'Running'}})
