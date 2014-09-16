#!/bin/bash
CRIT='heartbeat'
WARN='kernel: nfs: server'
STATE=''
MSG=$1

sendmail() {
  echo $1 | mail -s "rsyslog-test" zh1103@139.com
}

notify() {
#  'echo "$STATE;$MSG" | send_nsca -c /etc/nagios/send_nsca.cfg'
  echo "$STATE,$MSG"
}

check_state() {
  $(echo $MSG | egrep -q "$WARN") && STATE=1
  $(echo $MSG | egrep -q "$CRIT") && STATE=2
}

do_notify() {
  $(echo $STATE | grep -v -q 0) && notify
}

check_state
do_notify
