mount_nfs:
  cmd.run
    - name: mount -t nfs 192.168.11.33:/vol/ftp01 /mnt > /dev/null
    - stateful: True

install_cloud_supp_pack:
  cmd.run:
    - name: xe-install-supplemental-pack /mnt/isos/hypervisor/xenserver/xenserver-cloud-supp.iso > /dev/null
    - stateful: True

xs_patcher:
  cmd.run
    - name: cd /mnt/updates/xs_patcher && ./xs_patcher.sh > /dev/null
    - statefule: True

umount /mnt:
  cmd.wait:
    - cmd: xs_patcher
