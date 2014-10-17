# Written by WATO
# encoding: utf-8


extra_host_conf.setdefault('max_check_attempts', [])

extra_host_conf['max_check_attempts'] = [
  ( 3, ['/' + FOLDER_PATH + '/+'], ALL_HOSTS ),
] + extra_host_conf['max_check_attempts']


extra_host_conf.setdefault('check_interval', [])

extra_host_conf['check_interval'] = [
  ( 60.0, ['/' + FOLDER_PATH + '/+'], ALL_HOSTS ),
] + extra_host_conf['check_interval']


extra_host_conf.setdefault('retry_interval', [])

extra_host_conf['retry_interval'] = [
  ( 10.0, ['/' + FOLDER_PATH + '/+'], ALL_HOSTS ),
] + extra_host_conf['retry_interval']


extra_service_conf.setdefault('retry_interval', [])

extra_service_conf['retry_interval'] = [
  ( 10.0, ['/' + FOLDER_PATH + '/+'], ALL_HOSTS, ['PING'] ),
] + extra_service_conf['retry_interval']

