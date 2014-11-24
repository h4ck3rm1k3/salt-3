dnsmasq:
  pkg:
    - installed

/etc/dnsmasq.conf:
  file:
    - managed
    - source: salt://ROLES/pxe/dnsmasq.conf.jinja
    - template: jinja
    - require:
      - pkg: dnsmasq

dnsmasq_include:
  file:
    - recurse
    - name: /etc/dnsmasq.d
    - source: salt://ROLES/pxe/dnsmasq/dnsmasq.d
    - clean: True
    - mkdirs: True
    - template: jinja
    - require:
      - file: /etc/dnsmasq.conf

dnsmasq-deamon:    
  service:
    - name: dnsmasq
    - dead
    - enable: True
    - reload: True
    - watch:
      - file: /etc/dnsmasq.d
    - require:
      - file: /etc/dnsmasq.d
