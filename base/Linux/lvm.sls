#/dev/xvdb:
/dev/sdb:
  lvm.pv_present

vg_data01:
  lvm.vg_present:
    - devices: /dev/sdb
#    - devices: /dev/xvdb

#lv_data01:
#  lvm.lv_present:
#    - vgname: vg_data01
#    - size: 100G
#    - stripes: 5
#    - stripesize: 8K

lv_data01:
  cmd.run:
    - name: lvcreate -l  100%FREE -n lv_data01 vg_data01 > /dev/null
    - stateful: True
    - unless: lvs | grep -q lv_data01

mkfs.ext4:
  cmd.run:
    - name: mkfs.ext4 /dev/mapper/vg_data01-lv_data01 > /dev/null
    - stateful: True
    - unless: blkid | grep -q .*db1

/data01:
    mount.mounted:
     - persist: True
     - device: /dev/mapper/vg_data01-lv_data01
     - fstype: ext4
     - mkmnt: True
     - opts:
       - defaults
