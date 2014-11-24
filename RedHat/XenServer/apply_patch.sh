#!/bin/bash
test -f /mnt/updates && umount -l /mnt > /dev/null
mount -t stor03c1:/vol/ftp01 /mnt
cd /mnt/updates/xs_patcher && ./xs_patcher 1>/dev/null
