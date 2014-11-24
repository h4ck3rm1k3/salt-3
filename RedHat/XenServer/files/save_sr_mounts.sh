#!/bin/bash
get_sr_mounts() {
  grep nfs /proc/mounts | grep -v template | grep -v snapshot | grep -v sunrpc
}

print_nfsmounts_cmd(){
  get_sr_mounts | awk '{ print "mount -t nfs ",$1,$2,"-o rw,soft,timeo=133,tcp,actimeo=0" }'
}

print_nfsmounts_cmd > .sr_mounts.log
