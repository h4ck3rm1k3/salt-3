#disable_NetworkManager:
#  cmd.run:
#    - name: sed -i '/NM_CONTROLLED="yes"/s/yes/no/' /etc/sysconfig/network-scripts/ifcfg-eth*
#    - stateful: True

enable_nic:
  cmd.run:
    - name: sed -i '/ONBOOT="no"/s/no/yes/' /etc/sysconfig/network-scripts/ifcfg-eth*
    - stateful: True

disable_ipv6:
  cmd.run:
    - name: echo "NETWORKING_IPV6=no" >> /etc/sysconfig/network
    - unless: grep -q IPV6 /etc/sysconfig/network
    - stateful: True

sed -i "/^NETWORKING_IPV6/s/yes/no/" /etc/sysconfig/network:
  cmd.run:
    - stateful: True
