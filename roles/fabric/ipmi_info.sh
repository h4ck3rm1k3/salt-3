salt -G 'os:XenServer' cmd.run "ipmitool lan print | grep 'IP Address' | grep -v Source" --output text | awk -F ':' '{ print $1,$NF }'
