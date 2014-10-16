dnsmasq:
  pkg:
    - installed
  file:
    - managed
    - name: /etc/dnsmasq.conf
    - source: salt://service/pxe/dnsmasq.conf.jinja
    - template: jinja
  service:
    - running
    - enable: True
    - reload: True
    - watch:
      - file: /etc/dnsmasq.conf.d/ipxe.conf.jinja

ipxe-conf:
  file.managed:
    - name: /etc/dnsmasq.conf.d/ipxe.conf
    - source: salt://service/pxe/dnsmasq.conf.d/ipxe.conf
    - template: jinja
    - require:
      - pkg: dnsmasq
