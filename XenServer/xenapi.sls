XenAPI:
  file.managed:
    - name: /tmp/XenAPI.tar.gz
    - source: salt://XenServer/files/XenAPI-1.2.tar.gz
  cmd.run:
    - name: cd /tmp && tar xf XenAPI-1.2.tar.gz > /dev/null
    - stateful: True

inst_XenAPI:
  cmd.run:
    - name: cd /tmp/XenAPI-* && python setup.py install > /dev/null
    - stateful: True
