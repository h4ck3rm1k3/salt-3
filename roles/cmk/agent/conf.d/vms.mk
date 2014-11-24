for _host in _hosts:
    _vms = get_vms_of_host(_host)
    for _vm in _vms:
       if get_host_state(_vm) == 'ping':
           _h = get_all_host(_vm)
           all_hosts.append(_h)

           _ip = get_ipaddress(_vm)
           ipaddresses.update(_ip)

           _hostgroups = []
#           _created = get_created(_vm)
#           _hostgroups = _created.values()

    for _group in ['zonename', 'hostname', 'account']:
        _group_name = _vm[_group]
        _hg = get_hostgroup(_vm, _group_name)
        host_groups.append(_hg)


    _group_name = _vm['account']
    _cg = get_contactgroup(_vm, _group_name)
    host_contactgroups.append(_cg)

####################################################################################
# EXTRA_HOST_CONF
####################################################################################
    _prefix = '_CS_'

    _static_info = [
        'zonename', 'created', 'account', 'hypervisor','hostname', 'name', 'memory','id',
        'cpunumber', 'domain', 'haenable', 'state', 'templatename', 'rootdevicetype', 'passwordenabled', 'displayname'
    ]
    for _info in _static_info:
        _hostname = get_hostname(_vm)
        _name = _prefix + _info
        _data = _vm[_info]
        extra_host_conf.setdefault(_name, []).extend([(_data, [ _hostname])])
