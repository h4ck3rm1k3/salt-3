set_domain:
  cmd.run:
    - name: xe pif-param-set uuid=$(xe pif-list host-name-label=$(hostname) management=true --minimal) other-config:domain=hdtr.com
    - sateful: True
