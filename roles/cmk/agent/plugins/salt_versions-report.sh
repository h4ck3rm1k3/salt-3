#!/bin/bash
### Example data ###
#           Salt: 2014.1.0
#         Python: 2.6.8 (unknown, Nov  7 2012, 14:47:34)
#         Jinja2: 2.5.5
#       M2Crypto: 0.21.1
# msgpack-python: 0.1.12
#   msgpack-pure: Not Installed
#       pycrypto: 2.3
#         PyYAML: 3.08
#          PyZMQ: 2.2.0.1
#            ZMQ: 3.2.2
##########################################################
if which salt-call > /dev/null
then
    echo "<<<salt_versions-report>>>"
    salt-call --versions-report | sed -rn 's/^\s +//p'
fi
