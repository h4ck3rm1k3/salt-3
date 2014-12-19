#!/usr/bin/env python
import os, sys
import re, pprint

conf = './config.conf'
with open(conf) as f:
   info = {}
   s_begin = '^file='
   s_end = '^ *$'
   line_dict = {}
   for line in f.readlines():
       line = line.strip()
       if re.match(s_begin, line):
           cfg_file = line.split('/')[-1]
           info[cfg_file] = {}
           
       elif not re.match(s_end, line):
           data = line.split('=')
           opt = data[0]
           arg = data[1]
           info[cfg_file][opt] = arg

pp = pprint.PrettyPrinter()
pp.pprint(info)
