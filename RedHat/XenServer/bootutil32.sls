enable_pxe:
  file.managed:
    - name: /usr/sbin/bootutil32
    - source: salt://RedHat/XenServer/bootutil32
    - mode: 0644
  cmd.run:
    - name: bootutil32 -STE > /dev/null
    - stateful: True
