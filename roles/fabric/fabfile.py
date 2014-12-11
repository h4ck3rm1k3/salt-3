"""
    fabfile.py
    usage: fab -R feeble,bland,badass push_key:path/to/key.pub
"""
import os
from fabric.api import *
from fabric.contrib.files import append
import hosts
 
def read_key_file(key_file):
    key_file = os.path.expanduser(key_file)
    if not key_file.endswith('pub'):
        raise RuntimeWarning('Trying to push non-public part of key pair')
    with open(key_file) as f:
        return f.read()
 
def push_key(key_file='~/.ssh/id_rsa.pub'):
    set_env_passwd()
    key_text = read_key_file(key_file)
    append('~/.ssh/authorized_keys', key_text)

def date():
    run('date')

def debug():
    print(env['effective_roles'][0])

def yum_proxy(proxy='http://squid:3128'):
    proxy_txt = 'proxy=%s' % proxy
    append('/tmp/test', proxy_txt)

def start():
  push_key()
  with settings(hide('running', 'commands', 'stdout', 'stderr')):
    stdout = execute(date, hosts=env.hosts)
  print stdout.keys()

def set_env_passwd():
  role = env['effective_roles'][0]
  env.password = env['passwd_defs'][role]
