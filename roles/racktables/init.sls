xenimport_deps:
  pkg.installed:
    - names:
      - php-xmlrpc
      - php-xml
      - php-process
      - curl
  service:
    - name: httpd
    - running
    - reload: True
    - watch:
      - pkg: php-xmlrpc

/usr/share/RackTables:
  file.recurse:
    - source: salt://ROLES/racktables/files/RackTables
    - mkdirs: True
    - clean: True
