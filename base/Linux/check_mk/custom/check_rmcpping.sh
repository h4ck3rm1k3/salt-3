#!/bin//bash
if lsmod | grep ipmi_si -q;then
    if which ipmitool > /dev/null;then
        IPMI_IP=$(ipmitool lan print |egrep '^IP Address *:' | cut -d ':' -f2 |  sed -n 's/\s*//gp' )
        if [ ! -z $IPMI_IP ];then
          if which ipmitool > /dev/null;then
            if  rmcpping -c $count $IPMI_IP > /dev/null;then
                echo "IPMI IP OK: $IPMI_IP" && exit 0
            else
                echo "IPMI IP unareachable: $IPMI_IP" && exit 1
            fi
          else
            echo "rmcping not found" && exit 3
          fi
        else
            echo "IPMI IP not found: $IPMI_IP" && exit 2
        fi
    else
        echo "ipmitool not found" && exit 3
    fi
else
    echo "ipmi module: ipmi_si not loaded" && exit 3
fi
