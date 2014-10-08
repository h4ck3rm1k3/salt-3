{% if grains['manufacturer'] == 'Supermicro' %}
rack:
  grains.present:
    - value: WKS-B2-Fxx-Lxx
{% endif %}

#nodegroups:
#  ops: 'L@wiki,pxe,ntp,syslog,mail01,netflow,squid,ftp01,backup01'
#  nagios: 'L@nagios01,nagios02'
#  dns: 'L@dns01,dns02'
#  csm: 'L@csm01,csm02'
#  xsm: 'L@xsm01,xsm02'
#  csdb: 'L@csdb-master,csdb-slave'
#  test: 'L@salt-test'

owner:
  grains.present:
    - value: zhanghu
