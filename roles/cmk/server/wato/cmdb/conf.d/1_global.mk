############## GLOBAL SETTIINGS FOR CHECK_MK ###################
_hostname_source ={
    'HOST': 'name',
    'VM': 'instancename'
}

_hosttags_source ={
    'HOST': ['hypervisor', 'zonename', 'podname'],
    'VM': ['hypervisor', 'zonename', 'hostname', 'account']
}

define_hostgroups = True
define_contactgroups = True

execfile('./cs_apis.py')
