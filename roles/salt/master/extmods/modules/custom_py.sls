#!py
import os
import re
# return download ip for hosts ,used for state: hosts.present

def run():
  hosts = [
   "192.168.11.2",
   "10.24.4.4",
  ]

  hosts_time = {}
  for host in hosts:
    cmd = "ping -c 3 %s" % host
    content = os.popen(cmd).read()
    use_time = re.findall(r'time=(.*)ms',content)
    hosts_time[host] = sum([float(u) for u in use_time])
  hosts_time = sorted(hosts_time.items(),key=lambda hosts_time:hosts_time[1])
  ip = hosts_time[0][0]

  dict = {
      'download':{'host.present':[{'ip':ip,'names':['download.cn']}]}
    }
  return dict
