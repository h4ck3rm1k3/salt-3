#!/bin/bash
# find xen vms, which is ubuntu os,and save it's pv params to ./.ubuntu_pv_args/VMNAME.log

# todo: add cronly task to update
save_pv_params() {
  vm_name=`xe vm-list params=name-label --minimal uuid=$UUID`
  echo "xe vm-param-set uuid=$UUID HVM-boot-policy=" > $vm_name.log
  echo "xe vm-param-set uuid=$UUID PV-bootloader=pygrub" >> $vm_name.log
  echo "xe vm-param-set uuid=$UUID PV-bootloader-args=""${bootloader_args}""" >> $vm_name.log
  echo "xe vm-param-set uuid=$UUID PV-args=""${pv_args}""" >> $vm_name.log
}

set_boot_disk() {
  VBD=$(xe vm-disk-list uuid=$1 | grep -A1 VBD | tail -n 1 | cut -f2 -d: | sed "s/ *//g")
  if [ -z $VBD ]
  then
    echo "No VBD UUID found for $VBD."
    exit 0
  xe vbd-param-set uuid=$VBD bootable=true
  echo "xe vbd-param-set uuid=$VBD bootable=true" >> $vm_name.log
  fi
}

is_ubuntu_os() {
  UUID=$1
  os=`xe vm-param-get  uuid=$UUID param-name=os-version | awk -F '[;:]' '{ print $2}'`
  if echo $os | grep -q -i ubuntu;then
    bootloader_args=""
    pv_args=""
    get_pv_params $UUID
    save_pv_params
  fi
}

get_pv_params() {
  UUID=$1
  bootloader_args=`xe vm-param-get uuid=$UUID param-name=PV-bootloader-args`
  pv_args=`xe vm-param-get uuid=$UUID param-name=PV-args`
}

start() {
  uuids=`xe vm-list is-control-domain=false --minimal | tr ',' ' '`
  for uuid in $uuids
  do
    is_ubuntu_os $uuid
    set_boot_disk $uuid
  done
}

if [ -f /etc/xensource-inventory ];then
  test -d .ubuntu_pv_args || mkdir .ubuntu_pv_args
  cd .ubuntu_pv_args && rm -rf *
  start
fi
