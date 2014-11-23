#!/bin/bash
test -d /mnt/updates || mount -t nfs 192.168.11.33:/vol/ftp01 /mnt
cd /mnt/updates/xs_patcher
sh ./xs_patcher.sh > /dev/null
