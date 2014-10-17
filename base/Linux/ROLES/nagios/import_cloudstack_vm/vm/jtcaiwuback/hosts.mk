# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-25-1988-VM|lan|tcp_none|ping|up|Running|prod|wato|/" + FOLDER_PATH + "/",
]


# Settings for alias
extra_host_conf.setdefault('alias', []).extend(
  [(u'jtcaiwudbbackup', ['i-25-1988-VM'])])

# Settings for parents
extra_host_conf.setdefault('parents', []).extend(
  [('access-sw01,access-sw02', ['i-25-1988-VM'])])

host_contactgroups.append(
  ( ['jtcaiwuback'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-25-1988-VM': {'alias': u'jtcaiwudbbackup', 'tag_state': 'Running'}})
