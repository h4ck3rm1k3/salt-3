"""
    hosts.py
"""
from fabric.api import env
env.roledefs = {
    'xstest' : [
                'root@xstest1',
                'root@xstest2',
               ],
    'xsm' : [
                'root@xsm01',
                'root@xsm02',
               ],
}
