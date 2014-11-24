#!/bin/bash
#
# retrieve remaining day for xenserver license
#
# Date: 2010-04-15
# Author: Filippo Zanardo
#

# get arguments

while getopts w:c:hp OPT; do
case $OPT in
w) int_warn=$OPTARG;;
c) int_crit=$OPTARG;;
h) hlp=yes;;
*) unknown=yes;;
esac
done

# usage
HELP=
usage: $0 [ -w value -c value -h ]

syntax:

-w > Warning integer value
-c > Critical integer value
-h > print this help screen


if [ "$hlp" = "yes" -o $# -lt 1 ]; then
echo $HELP
exit 0
fi

# get license expiry date
EX=`xe host-license-view |grep expiry | awk { print $2; }`
DEX=${EX:0:8}

today=`date +%Y%m%d`
timeStampToday=`date +%s -d $today`
timeStampOfPast=`date +%s -d $DEX`
secondsInDay=86400
dayDiff=`echo \($timeStampOfPast  $timeStampToday\) / $secondsInDay  1 | bc`

#dayDiff is the day remaining

OUTPUT=$dayDiff days remaining

if [ -n "$int_warn" -a -n "$int_crit" ]; then

err=0

if (( $dayDiff <= $int_warn )); then
err=1
elif (( $dayDiff <= $int_crit )); then
err=2
fi

if (( $err == 0 )); then

echo -n "OK  $OUTPUT"
exit "$err"

elif (( $err == 1 )); then
echo -n "WARNING  $OUTPUT"
exit "$err"

elif (( $err == 2 )); then

echo -n "CRITICAL  $OUTPUT"
exit "$err"

fi

else

echo -n "no output from plugin"
exit 3

fi
exit
