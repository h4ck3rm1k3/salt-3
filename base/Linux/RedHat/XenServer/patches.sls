mount -t nfs 192.168.11.33:/vol/ftp01 /mnt:
  cmd.run
cd /mnt/updates/xs_patcher && ./xs_patcher.sh:
  cmd.run
umount /mnt:
  cmd.run
