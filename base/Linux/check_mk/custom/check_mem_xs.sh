#!/bin/bash
free_mem=$(xl info | grep free_memory | cut -d ':' -f2 | sed -n 's/\s\+//gp')
free_mem_gb=$(expr $free_mem / 1024 )
total_mem=$(xl info | grep total_memory | cut -d ':' -f2 | sed -n 's/\s\+//gp')
percent=$(($free_mem * 100 / $total_mem))

USAGE() {
  echo "USAGE(GB):  $0 -w 20 -c 10"
}

while getopts w:c:h option
do
    case "$option" in
        h)
            USAGE;;
        w)
            if [ $percent -lt $OPTARG ];then
                msg="free memory is: $percent %;$free_mem_gb GB"
                state=1
            fi
            echo $msg && exit $state
            ;;
        c)
            if [ $percent -lt $OPTARG ];then
                percent=$(($free_mem))
                msg="free memory is: $percent %;$free_mem_gb GB"
                state=1
            fi
            echo $msg && exit $state
            ;;
        \?)
            USAGE
            exit 3;;
    esac
done
