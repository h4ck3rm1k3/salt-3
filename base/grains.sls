{% if grains['manufacturer'] is defined %}
idc:
  grains.present:
    - value: WKS-B2-F00-L00
{% endif %}

#location:
#  grains.present:
#    - value: xsm02

#nodegroups:
#  ops: 'L@wiki,pxe,ntp,syslog,mail01,netflow,squid,ftp01,backup01'
#  nagios: 'L@nagios01,nagios02'
#  dns: 'L@dns01,dns02'
#  csm: 'L@csm01,csm02'
#  xsm: 'L@xsm01,xsm02'
#  csdb: 'L@csdb-master,csdb-slave'
#  test: 'L@salt-test'
