# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-23-1921-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-23-1923-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-23-1924-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-23-1925-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-23-1926-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-23-1927-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-23-1928-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-23-1929-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-23-1930-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-23-1931-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-23-1932-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
  "i-23-1934-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-23-1935-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
  "i-23-1936-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
]


# Settings for alias
extra_host_conf.setdefault('alias', []).extend(
  [(u'HRTRP', ['i-23-1928-VM']),
 (u'HRCSP', ['i-23-1929-VM']),
 (u'HRBWP', ['i-23-1923-VM']),
 (u'HRBOP', ['i-23-1925-VM']),
 (u'HRBOQ', ['i-23-1930-VM']),
 (u'HRPRD', ['i-23-1921-VM']),
 (u'no-HRTRQ', ['i-23-1932-VM']),
 (u'HRCSD', ['i-23-1935-VM']),
 (u'HRDOCP', ['i-23-1927-VM']),
 (u'HREPP', ['i-23-1924-VM']),
 (u'HRCSQ', ['i-23-1936-VM']),
 (u'HRAFP', ['i-23-1926-VM']),
 (u'HRTRD', ['i-23-1931-VM']),
 (u'HRDOCQ', ['i-23-1934-VM'])])

# Settings for parents
extra_host_conf.setdefault('parents', []).extend(
  [('access-sw01,access-sw02', ['i-23-1928-VM']),
 ('access-sw01,access-sw02', ['i-23-1929-VM']),
 ('access-sw01,access-sw02', ['i-23-1923-VM']),
 ('access-sw01,access-sw02', ['i-23-1925-VM']),
 ('access-sw01,access-sw02', ['i-23-1930-VM']),
 ('access-sw01,access-sw02', ['i-23-1921-VM']),
 ('access-sw01,access-sw02', ['i-23-1932-VM']),
 ('access-sw01,access-sw02', ['i-23-1935-VM']),
 ('access-sw01,access-sw02', ['i-23-1927-VM']),
 ('access-sw01,access-sw02', ['i-23-1924-VM']),
 ('access-sw01,access-sw02', ['i-23-1936-VM']),
 ('access-sw01,access-sw02', ['i-23-1926-VM']),
 ('access-sw01,access-sw02', ['i-23-1931-VM']),
 ('access-sw01,access-sw02', ['i-23-1934-VM'])])

host_contactgroups.append(
  ( ['prodgdhr'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-23-1921-VM': {'alias': u'HRPRD', 'tag_state': 'Running'},
 'i-23-1923-VM': {'alias': u'HRBWP', 'tag_state': 'Running'},
 'i-23-1924-VM': {'alias': u'HREPP', 'tag_state': 'Running'},
 'i-23-1925-VM': {'alias': u'HRBOP', 'tag_state': 'Running'},
 'i-23-1926-VM': {'alias': u'HRAFP', 'tag_state': 'Running'},
 'i-23-1927-VM': {'alias': u'HRDOCP', 'tag_state': 'Running'},
 'i-23-1928-VM': {'alias': u'HRTRP', 'tag_state': 'Running'},
 'i-23-1929-VM': {'alias': u'HRCSP', 'tag_state': 'Running'},
 'i-23-1930-VM': {'alias': u'HRBOQ', 'tag_state': 'Running'},
 'i-23-1931-VM': {'alias': u'HRTRD', 'tag_state': 'Running'},
 'i-23-1932-VM': {'alias': u'no-HRTRQ', 'tag_state': 'Stopped'},
 'i-23-1934-VM': {'alias': u'HRDOCQ', 'tag_state': 'Running'},
 'i-23-1935-VM': {'alias': u'HRCSD', 'tag_state': 'Running'},
 'i-23-1936-VM': {'alias': u'HRCSQ', 'tag_state': 'Running'}})
