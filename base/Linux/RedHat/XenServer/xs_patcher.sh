#!/bin/bash
mount -t nfs 192.168.11.33:/vol/ftp01 /mnt
cp /mnt/isos/hypervisor/xenserver/xenserver-cloud-supp.iso /tmp
xe-install-supplemental-pack /tmp/xenserver-cloud-supp.iso > /dev/null
cd /mnt/updates/xs_patcher
./xs_patcher.sh > /dev/null &
sleep 5
wait
cd / && umount /mnt

