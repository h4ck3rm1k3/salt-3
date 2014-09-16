#!/bin/bash
#ipmi_ip_src=`ipmitool lan print | grep -E 'IP Address Source\s+:'`
#ipmi_ip_mac=`ipmitool lan print | grep -E 'MAC Address\s+:' | awk -F ' ' '{print $4}'`
#ipmi_ip_addr=`ipmitool lan print | grep -E 'IP Address\s+:' | cut -d: -f2 | sed -n 's/\s//p'`
#ipmi_ip_mask=` ipmitool lan print | grep -E 'Subnet Mask\s+:' | cut -d: -f2 | sed -n 's/\s//p'`
#ipmi_ip_gw=`ipmitool lan print | grep -E 'Default Gateway IP\s+:' | awk -F ' ' '{print $5}'`
#ipmi_ip_mod=`lsmod | grep ipmi`

lsmod | grep -q ipmi
if [ $? -ne 0 ];then
   modprobe ipmi_si
   modprobe ipmi_devintf
   modprobe ipmi_poweroff
fi

echo '<<<ipmi_info>>>'
if which ipmitool > /dev/null 2>&1;then
  ipmitool lan print | sed -n '/IP Address Source/,/802.1q VLAN Priority/p'
fi
