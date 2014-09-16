#coding=utf8
import json
def __virtual__():
    return 'cmk_hosts'
def returner(ret):
    '''
    Return host data for check_mk hosts mk files
    '''
    result_file = '/tmp/salt/cmk/hosts.mk'
#    with open(result_file,'a+') as result:
#    result.write(str(json.dumps(ret.values()))[1:-1]+'\n')
    print ret.values()
