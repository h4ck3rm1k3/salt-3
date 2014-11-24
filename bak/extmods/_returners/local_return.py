#coding:utf-8
def __virtual__():
   return "local_return"
def returner(ret):
    f=open('/var/log/salt/local_returner.log','a+')
    f.write(str(ret)[1:-1]+'\n')
    f.close()
