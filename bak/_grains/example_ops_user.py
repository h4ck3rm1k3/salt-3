#!/usr/bin/env python

import urllib2

def ops_user():
  grains = {}
  ops_user = urllib2.urlopen('https://test.com/api/opsuser').read()　　　＃这里放回的是一个以逗号分割的字符串
  ops_user = ops_user.split(',')
  grains['ops_user'] = ops_user
  return grains

if __name__ == '__main__':
  print ops_user()
