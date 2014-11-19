execfile('./1_global.mk')
_hosts = get_hosts()

###############################################################################
# HOST
###############################################################################
for _host in _hosts:
    _h = get_all_host(_host)
    all_hosts.append(_h)

    _ip = get_ipaddress(_host)
    ipaddresses.update(_ip)

###############################################################################
# HOST GORUPS
###############################################################################
    for _group in ['hypervisor', 'zonename', 'podname', 'clustername']:
        _group_name = _host[_group]
        _hg = get_hostgroup(_host, _group_name)
        host_groups.append(_hg)
 
###############################################################################
# CONTACT GORUPS
###############################################################################
    _group_name = _host['hypervisor']
    _cg = get_contactgroup(_host, _group_name)
    host_contactgroups.append(_cg)


###############################################################################
# EXTRA_HOST_CONF: STATIC
# extra_host_conf['_ec_sl'] = [
#   ( 5, ['/' + FOLDER_PATH + '/+'], ALL_HOSTS ),
#   ] + extra_host_conf['_ec_sl']
###############################################################################

    _prefix = '_CS_'

    _static_info = ['id', 'clustertype', 'created', 'memorytotal', 'type', 'version']
    for _info in _static_info:
        _hostname = get_hostname(_host)
        _name = _prefix + _info
        _data = _host[_info]
        extra_host_conf.setdefault(_name, []).extend([(_data, [ _hostname])])
###############################################################################
# EXTRA_HOST_CONF: DYNMAIC OF CLOUDSTACK
###############################################################################
