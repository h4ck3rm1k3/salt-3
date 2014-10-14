#base:
#  '*':
#    - grains
#    - pillars
#  '^((?!foo).)*$':
#    - match: pcre
#    - resolv
#  '192.168.0.0/16':
#    - match: ipcidr
#    - resolv

