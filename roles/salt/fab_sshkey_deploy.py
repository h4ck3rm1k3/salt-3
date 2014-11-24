#!/usr/bin/python
import sys, os
from fabric.api import *

def set_hosts():
  host_conf = './host.conf'
  with open(host_conf) as f:
    for line in f.readlines():
      if len(line) < 4:
        sys.exit("ERROR")

      for user, password, host, port in f.readlines():
        login = "{0}@{1}".format(user, host)
        secret = "{0}@{1}:{2}".format(user, host, port)
        env.hosts.append(( login ))
        env.passwords.update((login, secret))

set_host()
print env.hosts
print env.passwords
