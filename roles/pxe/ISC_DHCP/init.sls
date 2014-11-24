dhcp:
  pkg:
    - installed
  file.recurse:
    - name: /etc/dhcp
    - source: salt://ROLES/pxe/ISC_DHCP/dhcp
    - template: jinja
    - mkdirs: True
    - clean: True
    - require:
      - pkg: dhcp
  service:
    - name: dhcpd
    - running
    - reload: True
    - watch:
      - file: /etc/dhcp
    - require:
      - file: /etc/dhcp
