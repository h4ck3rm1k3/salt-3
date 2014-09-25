#! /usr/bin/env python
'''Support for running check_mk_agent over salt
  /srv/salt/_modules/check_mk.py'''
import os
import salt.utils
from salt.exceptions import SaltException

def __virtual__():
    ''' Only load the module if check-mk-agent is installed '''
    if os.path.exists('/usr/bin/check_mk_agent'):
        return 'check_mk'
    return False

def agent():
    ''' Return the output of check_mk_agent '''
    return __salt__['cmd.run']('check_mk_agent')

def foo(bar):
    return __salt__['cmd.run'](bar)

#__outputter__ = {
#                'run': 'txt'
#                }
