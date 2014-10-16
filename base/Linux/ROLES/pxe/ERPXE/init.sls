/var/www/html/pxe:
  file.recurse:
    - source: salt://ROLES/pxe/ERPXE/files
    - clean: True
    - mkdirs: True
    - template: jinja
