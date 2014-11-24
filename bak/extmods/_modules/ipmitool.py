import os
import popen2

def run():
        cmd = "lsattr /etc/hostname /etc/resolv.conf"
        child=os.popen(cmd)
        data = child.read()
        return data
