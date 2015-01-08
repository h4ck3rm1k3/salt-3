_lock = 'CloudStack Instances'
_account = 'fengce'

def make_api():
    import CloudStack
    _api = 'http://csm01:8080/client/api'
    #admin
    _apikey='f0Q70X5oTpax-b7bvyzDQf2t_rKaK0rWkLXhejPRqI4i6IgiSq5rJ5_KXo7pCE9-HpYqAYllg_Td9675H3E31Q'
    _secret='8VxNvOkcKn7ibGAQhmI2L8frA7LmdN-IIGXNgmKJ_UxzWTpc487cFLE-vq0yLrXS6-dzL7luNecUyH0elrOA9g'
    _api = CloudStack.Client(_api, _apikey, _secret)
    return _api

def get_vms():
    _request = {
      'listall':'true',
      'account': _account
     }
    _api = make_api()
    return _api.listVirtualMachines(_request)


def get_ipaddress(_vm):
    _hostname = _vm['instancename']

    if _vm.has_key('publicip'):
        return _vm['publicip']
    else:
        for _nic in _vm['nic']:
            if _nic['type'] == 'Shared' and _nic['isdefault'] == 'True':
                return _nic['ipaddress']

def get_hosttags(_vm):
    _tags = []
    _tags.append(_vm['account'])
    return '|'.join(_tags)

def debug():
    with open('/tmp/test.log', 'w') as _f:
        _pp = pprint.PrettyPrinter() 
        _vars = globals()
        _pp.pprint(_vars)

_vms = get_vms()
for _vm in _vms:
    _hostname = _vm['instancename']
    _ip = get_ipaddress(_vm)
    if _ip: 
        _tags = get_hosttags(_vm)
        _cmk_host = '%s|wato|%s' % (_hostname, _tags)
        _attrs = {
            'alias': _vm['displayname'],
            'tag_objtype': 'vm',
            'virt_ype': _vm['hypervisor'],
        }

        all_hosts.append(_cmk_host)
#        host_attributes.update({_hostname: _attrs})

for _vm in _vms:
    _hostname = _vm['instancename']
    _ip = get_ipaddress(_vm)
    ipaddresses[_hostname] = _ip
