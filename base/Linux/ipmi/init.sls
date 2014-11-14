{% if grains['os'] == 'XenServer' %}
ipmi-pkgs:
  pkg.installed:
    - names:
      - ipmiutil
      - freeipmi-ipmidetectd
      - freeipmi

ipmi_si:
  kmod.present

enable_kmod_ipmi:
  cmd.run:
    - name: sed -i '/^blacklist ipmi_si/s/^/#/' /etc/modprobe.d/blacklist-ipmi
    - onlyif: test -c /dev/ipmi0
    - stateful: True
{% endif %}
