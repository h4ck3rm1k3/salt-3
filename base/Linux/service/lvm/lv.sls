#/dev/sda:
#  lvm.pv_present

#my_vg:
#  lvm.vg_present:
#    - devices: /dev/sda

#data01:
#  lvm.lv_present:
#    - vgname: system
#    - size: 10G
#    - stripes: 5
#    - stripesize: 8K
