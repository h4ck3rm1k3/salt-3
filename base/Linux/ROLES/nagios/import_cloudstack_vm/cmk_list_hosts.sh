#!/bin/bash

wato_hosts=`echo -e "GET hosts\nColumns: name" | unixcat  ~/tmp/run/live`
