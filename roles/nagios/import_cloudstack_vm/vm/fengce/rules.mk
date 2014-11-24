# Written by WATO
# encoding: utf-8


host_contactgroups = [
  ( 'fengce', ['/' + FOLDER_PATH + '/+'], ALL_HOSTS, {'comment': u'Put all hosts into the contact group "fengce"'} ),
] + host_contactgroups


active_checks.setdefault('tcp', [])

active_checks['tcp'] = [
  ( (22, {'svc_description': u'SSH'}), ['tcp_22', '/' + FOLDER_PATH + '/+'], ALL_HOSTS ),
] + active_checks['tcp']

