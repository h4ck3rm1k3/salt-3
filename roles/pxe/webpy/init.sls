python-webpy:
  pkg.installed

/var/www/html/webpy:
  file.recurse:
    - source: salt://ROLES/pxe/webpy/web
    - mkdirs: True
    - clean: True
    - require:
      - pkg: python-webpy

/etc/httpd/conf.d/webpy.conf:
  file.managed:
    - source: salt://ROLES/pxe/webpy/webpy.conf
    - require:
      - file: /var/www/html/webpy
  service:
    - name: httpd
    - running
    - reload: True
    - watch:
      - file: /etc/httpd/conf.d/webpy.conf
    - require:
      - file: /etc/httpd/conf.d/webpy.conf
     


