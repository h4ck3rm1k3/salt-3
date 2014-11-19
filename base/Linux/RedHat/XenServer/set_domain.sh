#!/bin/bash
host_name=`hostname`
pif_mgmt_id=$(xe pif-list host-name-label=$host_name management=true --minimal)
xe pif-param-set uuid=$pif_mgmt_id other-config:domain=hdtr.com
