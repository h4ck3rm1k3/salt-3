# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-9-1944-VM|lan|tcp_80|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-9-1945-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-9-1953-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-9-1954-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
  "i-9-1955-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
]


# Settings for alias
extra_host_conf.setdefault('alias', []).extend(
  [(u'stop-tmp-appbackup-xs', ['i-9-1954-VM']),
 (u'ReportRelease-xs', ['i-9-1953-VM']),
 (u'ldap-server-xs', ['i-9-1945-VM']),
 (u'khSVN-xs', ['i-9-1955-VM']),
 (u'portal-server', ['i-9-1944-VM'])])

# Settings for parents
extra_host_conf.setdefault('parents', []).extend(
  [('access-sw01,access-sw02', ['i-9-1954-VM']),
 ('access-sw01,access-sw02', ['i-9-1953-VM']),
 ('access-sw01,access-sw02', ['i-9-1945-VM']),
 ('access-sw01,access-sw02', ['i-9-1955-VM']),
 ('access-sw01,access-sw02', ['i-9-1944-VM'])])

host_contactgroups.append(
  ( ['jituanmenhu'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-9-1944-VM': {'alias': u'portal-server',
                 'tag_port_tcp': 'tcp_80',
                 'tag_state': 'Running'},
 'i-9-1945-VM': {'alias': u'ldap-server-xs', 'tag_state': 'Running'},
 'i-9-1953-VM': {'alias': u'ReportRelease-xs', 'tag_state': 'Running'},
 'i-9-1954-VM': {'alias': u'stop-tmp-appbackup-xs', 'tag_state': 'Stopped'},
 'i-9-1955-VM': {'alias': u'khSVN-xs', 'tag_state': 'Running'}})
