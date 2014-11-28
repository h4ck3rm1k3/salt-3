#!/bin/bash
if [ lsmod | grep ipmi_si -q ];then
    echo "IPMI_ADMIN" | xargs ipmitool user set password 2
fi
