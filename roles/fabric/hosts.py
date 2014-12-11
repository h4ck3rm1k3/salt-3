"""
    hosts.py
"""
from fabric.api import env

env.disable_known_hosts = True
#env.use_shell = ''
env.roledefs = {
    'mgmt': ['root@xsm01', 'root@xsm02'],
    'z2p1c1': ['root@xs02', 'root@xs03', 'root@xs04', 'root@xs05', 'root@xs06', 'root@xs07', 'root@xs08'],
    'z2p1c2': ['root@xs227', 'root@xs228', 'root@xs229'],
    'z2p2c1': ['root@xs51', 'root@xs52', 'root@xs53', 'root@xs54', 'root@xs226'],
    'z2p201c1': ['root@xstest1', 'root@xstest2'],
    'z3p1c1': ['root@xs201', 'root@xs202', 'root@xs203', 'root@xs204', 'root@xs205'],
    'z3p1c2': ['root@xs211', 'root@xs212', 'root@xs213', 'root@xs214'],
    'z3p1c3': ['root@xs221', 'root@xs222', 'root@xs223', 'root@xs224', 'root@xs225'],
    'z3p1c4': ['root@xs231', 'root@xs232', 'root@xs233', 'root@xs234', 'root@xs235', 'root@xs236'],
    'z3p1c5': ['root@xs241', 'root@xs242', 'root@xs243', 'root@xs244'],
    'z4p1c1': ['root@z4p1c1h1', 'root@z4p1c1h2', 'root@z4p1c1h3'],
}

env['passwd_defs'] = {
    'z2p1c1': 'Tianren.481~m',
    'z2p1c2': 'Tianren.112~m',
    'z2p2c1': 'Tianren.131~m',
    'z2p201c1': 'Tianren.2011~m',
    'z3p1c1': 'Tianren.141~m',
    'z3p1c2': 'Tianren.142~m',
    'z3p1c3': 'Tianren.143~m',
    'z3p1c4': 'Tianren.144~m',
    'z3p1c5': 'Tianren.145~m',
    'z4p1c1': 'Tianren.151~m',
}
