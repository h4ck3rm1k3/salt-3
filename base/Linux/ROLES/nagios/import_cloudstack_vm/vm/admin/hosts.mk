# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-2-1780-VM|lan|tcp_none|ping|down|Stopped|prod|wato|/" + FOLDER_PATH + "/",
]


# Settings for alias
extra_host_conf.setdefault('alias', []).extend(
  [(u'(no)digitalpw', ['i-2-1780-VM'])])

# Settings for parents
extra_host_conf.setdefault('parents', []).extend(
  [('access-sw01,access-sw02', ['i-2-1780-VM'])])

host_contactgroups.append(
  ( ['admin'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-2-1780-VM': {'alias': u'(no)digitalpw', 'tag_state': 'Stopped'}})
