#more       /var/named/chroot/var/named/10.hdtr.com.zone   这里里添加对应的记录，并且修改	20140605	; seriali 这个字段的数值加1 

add_cname:
#  cmd.script:
#    - name: /var/named/chroot/var/named/10.hdtr.com.zone
  service:
    - running
    - enable: True
    - name: named
    - reload
    - watch:
      - file: /var/named/chroot/var/named/10.hdtr.com.zone
    - require:
      - cmd: add_host
  cmd.run:
    - name: rndc reload
    - require:
      - service: named
