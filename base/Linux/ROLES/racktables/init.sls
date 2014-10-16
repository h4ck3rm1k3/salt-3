xenimport_deps:
  pkg.installed:
    - names:
      - php-xmlrpc
      - php-xml
      - php-process
      - curl

/usr/share/RackTables:
  file.recurse:
    - source: salt://ROLES/racktables/files/RackTables
    - mkdirs: True
    - clean: True
