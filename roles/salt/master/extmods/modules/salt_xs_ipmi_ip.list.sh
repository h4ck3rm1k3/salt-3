salt -G 'os:XenServer' cmd.run "ipmitool lan print | awk '/IP Address/{ print $NF}' | grep -v Source" --output txt | awk -F ':' '{ print $1,$NF}'
