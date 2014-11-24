#!/bin/bash
bak_counts=`ls -l /home/dbbak* | wc -l`
if [ ${bak_counts} -gt 100 ];then
        find /home/ -iname "dbbak_cloud*" -mtime +100 --exec rm -f {} \; >/dev/null 2>&1
fi
DATE=`date +%F-%T`
mysqldump  --all-database -u root --password=password > /home/dbbak-${DATE}.`mktemp XXXX.txt`
