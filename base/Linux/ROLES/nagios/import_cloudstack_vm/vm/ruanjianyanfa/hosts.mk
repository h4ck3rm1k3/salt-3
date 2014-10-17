# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-12-1950-VM|lan|tcp_none|cmk-agent|up|tcp|Running|prod|wato|/" + FOLDER_PATH + "/",
]


# Settings for alias
extra_host_conf.setdefault('alias', []).extend(
  [(u'mgmt-swdev', ['i-12-1950-VM'])])

# Settings for parents
extra_host_conf.setdefault('parents', []).extend(
  [('access-sw01,access-sw02', ['i-12-1950-VM'])])

host_contactgroups.append(
  ( ['ruanjianyanfa'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-12-1950-VM': {'alias': u'mgmt-swdev',
                  'tag_agent': 'cmk-agent',
                  'tag_state': 'Running'}})
