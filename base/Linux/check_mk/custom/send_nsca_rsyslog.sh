#!/bin/bash
#echo -e "xs214\tsr-nfs\t2\tCRITIAL" | send_nsca -H nagios01 -c  /etc/nagios/send_nsca.cf

inerval=30
#HOSTNAME=$(hostname -s)
send_nsca_cmd="send_nsca -H nagios01 -c /etc/nagios/send_nsca.cfg"

function mem_used(){
     WARN=80.00
     CRIT=90.00

     mem_total=`xe host-list name-label=xsm02 params=memory-total --minimal`
     mem_free=`xe host-list name-label=xsm02 params=memory-free --minimal`
     percent=`echo "scale=2;$mem_free/$mem_total*100"|bc`
     echo $percent

     if [ $percent -le $WARN ];then
         ret=0
     elif [ $percent -gt $WARN -a $percent -lt $CRIT ];then
         ret=1
     elif [ $percent -ge $CRIT ];then
         ret=2
     fi

  echo -e "xsm02\tnsca_system\t$ret\tMemory Used: $percent"
}

function check_mem(){
while true
do
    echo -e "xsm02\tnsca_mem_used\t0\tMemory Used: $percent"
# | $send_nsca_cmd
    sleep 1
done
}

#check_mem
#mem_used
