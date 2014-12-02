#!/bin/bash
# xe pif-param-remove param-name=other-config param-key=domain uuid=xxxxxxxxxxxxxxxxx
host_name=`hostname`
pif_mgmt_id=$(xe pif-list host-name-label=$host_name management=true --minimal)
xe pif-param-set uuid=$pif_mgmt_id other-config:domain=hdtr.com
grep -q 'hdtr.com' /etc/resolv.conf || echo 'domain hdtr.com' >> /etc/resolv.conf
