# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-2-1780-VM|ping|lan|prod|Stopped|wato|/" + FOLDER_PATH + "/",
]


# Settings for alias
extra_host_conf.setdefault('alias', []).extend(
  [(u'test', ['i-2-1780-VM'])])

host_contactgroups.append(
  ( ['admin'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-2-1780-VM': {'alias': u'test', 'tag_state': 'Stopped'}})
