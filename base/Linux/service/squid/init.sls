{% if grains['id'].startswith('squid') %}
iptables-pkgs:
  pkg.installed:
    - pkgs:
      - iptables
      - iptables-persistent

set_ipv4_forward:
  cmd.run:
    - name: echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
    - unless: grep -q net.ipv4.ip_forward=1 /etc/sysctl.conf
    - stateful: True

sysctl -p:
  cmd.wait:
    - stateful: True
    - watch:
      - cmd: set_ipv4_forward

open_ipv4_forward:
  cmd.run:
    - name: echo 1 > /proc/sys/net/ipv4/ip_forward
    - unless: cat /proc/sys/net/ipv4/ip_forward | grep -q 1
    - stateful: True

redirect_tcp_80:
  cmd.wait:
    - name: iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 3128
    - stateful: True
    - watch:
      - cmd: redirect_tcp_8080

redirect_tcp_8080:
  cmd.wait:
    - name: iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 8080 -j REDIRECT --to-port 3128
    - stateful: True
    - watch:
      - cmd: redirect_tcp_443

redirect_tcp_443:
  cmd.wait:
    - name: iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 3128
    - stateful: True
    - watch:
      - cmd: open_ipv4_forward

save_rules:
  cmd.wait:
    - name: iptables-save > /etc/iptables/rules
    - stateful: True
    - watch:
      - cmd: redirect_tcp_80
    
iptables-persistent:
  service.running:
    - enable: True
    - require:
      - pkg:
        - iptables
        - iptables-persistent

set_squid_transparent:
  cmd.run:
    - name: echo 'http_port 3128 transparent' >> /etc/squid/squid.conf
    - unless: egrep -q 'http_port 3128 transparent' /etc/squid/squid.conf
    - stateful: True 

squid_conf:
   file.managed:
     - name: /etc/squid/squid.conf
     - source: salt://squid/squid.conf
     - require:
       - pkg: squid

squid:
  pkg.installed
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: squid_conf
    - require:
      - pkg: squid

{% endif %}
