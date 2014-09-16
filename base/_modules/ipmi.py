#! /usr/bin/env python
'''Support for running ipmitool over salt
  /srv/salt/_modules/ipmi.py'''
import os
#import pyipmi
import salt.utils
from salt.exceptions import SaltException

def __virtual__():
    ''' Only load the module if ipmitool is installed '''
    if os.path.exists('/usr/bin/ipmitool'):
        return 'ipmi'
    return False

def lan_print():
    ''' Return the output of command: ipmitool lan print '''
    ret = __salt__['cmd.run']('ipmitool lan print')
    return ret
