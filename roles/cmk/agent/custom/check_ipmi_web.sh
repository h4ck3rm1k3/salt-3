#!/bin/bash
if lsmod | grep ipmi_si -q;then
    if which ipmitool > /dev/null;then
        IPMI_IP=$(ipmitool lan print |egrep '^IP Address *:' | cut -d ':' -f2 |  sed -n 's/\s*//gp' )
        if [ ! -z $IPMI_IP ];then
            if [ -e /usr/lib64/nagios/plugins/check_http ];then
                CHECK_HTTP='/usr/lib64/nagios/plugins/check_http'
            elif [ -e /usr/lib/nagios/plugins/check_http ];then
                CHECK_HTTP='/usr/lib/nagios/plugins/check_http'
            else
                echo "nagiois plugin: check_http not found" && exit 3
            fi
            $CHECK_HTTP -w 5 -c 10 --ssl -H $IPMI_IP
        else
            echo "IPMI IP not found" && exit 3
        fi
    else
        echo "ipmitool not found" && exit 3
    fi
else
    echo "ipmi module: ipmi_si not found" && exit 3
fi
