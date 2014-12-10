"""
    fabfile.py
    usage: fab -R feeble,bland,badass push_key:path/to/key.pub
"""
import os
from fabric.api import task
from fabric.contrib.files import append
import hosts
 
def read_key_file(key_file):
    key_file = os.path.expanduser(key_file)
    if not key_file.endswith('pub'):
        raise RuntimeWarning('Trying to push non-public part of key pair')
    with open(key_file) as f:
        return f.read()
 
@task
def push_key(key_file='~/.ssh/id_rsa.pub'):
    key_text = read_key_file(key_file)
    append('~/.ssh/authorized_keys', key_text)
