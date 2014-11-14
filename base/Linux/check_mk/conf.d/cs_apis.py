def cs_client():
  import CloudStack
  _api = 'http://csm01:8080/client/api'
  #admin
  _apikey='f0Q70X5oTpax-b7bvyzDQf2t_rKaK0rWkLXhejPRqI4i6IgiSq5rJ5_KXo7pCE9-HpYqAYllg_Td9675H3E31Q'
  _secret='8VxNvOkcKn7ibGAQhmI2L8frA7LmdN-IIGXNgmKJ_UxzWTpc487cFLE-vq0yLrXS6-dzL7luNecUyH0elrOA9g'
  _cs_client = CloudStack.Client(_api, _apikey, _secret)
  return _cs_client

def get_all_host(_host):
    if host_type(_host) == 'VM':
        _tags = get_host_tags(_host)
        _data = "{0}|{1}".format(_host['instancename'], _tags)

    if host_type(_host) == 'HOST':
        _tags = get_host_tags(_host)
        _data = "{0}|{1}".format(_host['name'], _tags)

    return _data

def get_host_state(_host):
    _state = ''
    if host_type(_host) == 'HOST':
        if _host['state'] == 'Up':
            _state = 'ping'
        else:
            _state = 'offline'
    elif host_type(_host) == 'VM':
        _ip = get_ipaddress(_host)
        if _ip.values()[0] == '':
            _state = 'offline'
        else:
            _state = 'ping'

    return _state

def get_tag_crit(_host):
    _crit = get_host_state(_host)
    return _crit

def get_host_tags(_host):
    _tags = ['lan','prod']
    _crit = get_tag_crit(_host)
    _tags.append(_crit)

    _type = host_type(_host)
    _details = _hosttags_source[_type]
    for _d in _details:
        _tags.append(_host[_d])

    _tags = '|'.join(_tags)
    return _tags

def get_ipaddress(_host):
    _ip = ''
    if host_type(_host) == 'HOST':
        _ip = _host['ipaddress']

    if host_type(_host) == 'VM':
        if _host.has_key('publicip'):
            _ip = _host['publicip']
        else:
            for _nic in _host['nic']:
                if _nic['type'] == 'Shared':
                    _ip = _nic['ipaddress']
       
    _hostname = get_hostname(_host)
    _ipaddress = {_hostname: _ip}
    return _ipaddress

def get_vms_of_host(_host):
    _cs = cs_client()
    _params = {
        'listall': 'true',
        'hostid': _host['id']
    }
    _vms = _cs.listVirtualMachines(_params)
    
    return _vms

def get_hosts(_type='Routing'):
    _cs = cs_client()
    _params = {
        'listall': 'true',
        'type': _type
    }
    _hosts = _cs.listHosts(_params)
    return _hosts

def host_type(_host):
    if _host.has_key('instancename'):
        _t = 'VM'
    else:
        _t = 'HOST'
    return _t

def get_hostname(_host):
    _type = host_type(_host)
    _name_id = _hostname_source[_type]
    _hostname = _host[_name_id]
    return _hostname

def get_hostgroup(_host_dict, _group_name):
    _hostname = get_hostname(_host_dict)
    _hg = (_group_name, [_hostname])
    return _hg

def get_created(_host):
    _timestamp = _host['created']
    _created = {
        'day': _timestamp[:10],
        'month': _timestamp[:7],
        'year': _timestamp[:4]
    }

    return _created

def get_contactgroup(_host_dict, _group_name):
    _hostname = get_hostname(_host_dict)
    _cg = (_group_name, [ _hostname ])
    return _cg
