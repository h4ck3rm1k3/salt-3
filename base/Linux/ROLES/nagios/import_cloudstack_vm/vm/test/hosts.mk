# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-21-1887-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-21-1896-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-21-1898-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-21-1899-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-21-1906-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-21-1917-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-21-1987-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-21-2010-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-21-2015-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
]


# Settings for alias
extra_host_conf.setdefault('alias', []).extend(
  [(u'wxp3-1', ['i-21-1896-VM']),
 (u'SVMS', ['i-21-1917-VM']),
 (u'qiaoshanhetest1', ['i-21-2010-VM']),
 (u'W2K8R2-2', ['i-21-1906-VM']),
 (u'SCADA1', ['i-21-1987-VM']),
 (u'wxp3-2', ['i-21-1898-VM']),
 (u'W2K8R2-1', ['i-21-1899-VM']),
 (u'SCADA2', ['i-21-1887-VM']),
 (u'test01', ['i-21-2015-VM'])])

# Settings for parents
extra_host_conf.setdefault('parents', []).extend(
  [('access-sw01,access-sw02', ['i-21-1896-VM']),
 ('access-sw01,access-sw02', ['i-21-1917-VM']),
 ('access-sw01,access-sw02', ['i-21-2010-VM']),
 ('access-sw01,access-sw02', ['i-21-1906-VM']),
 ('access-sw01,access-sw02', ['i-21-1987-VM']),
 ('access-sw01,access-sw02', ['i-21-1898-VM']),
 ('access-sw01,access-sw02', ['i-21-1899-VM']),
 ('access-sw01,access-sw02', ['i-21-1887-VM']),
 ('access-sw01,access-sw02', ['i-21-2015-VM'])])

host_contactgroups.append(
  ( ['test'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-21-1887-VM': {'alias': u'SCADA2', 'tag_state': 'Running'},
 'i-21-1896-VM': {'alias': u'wxp3-1', 'tag_state': 'Running'},
 'i-21-1898-VM': {'alias': u'wxp3-2', 'tag_state': 'Running'},
 'i-21-1899-VM': {'alias': u'W2K8R2-1', 'tag_state': 'Running'},
 'i-21-1906-VM': {'alias': u'W2K8R2-2', 'tag_state': 'Running'},
 'i-21-1917-VM': {'alias': u'SVMS', 'tag_state': 'Running'},
 'i-21-1987-VM': {'alias': u'SCADA1', 'tag_state': 'Running'},
 'i-21-2010-VM': {'alias': u'qiaoshanhetest1', 'tag_state': 'Running'},
 'i-21-2015-VM': {'alias': u'test01', 'tag_state': 'Running'}})
