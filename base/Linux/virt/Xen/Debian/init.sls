xs-tools:
  file.recurse:
    - name: /tmp/xs-tools
    - source: salt://virt/Xen/Debian/xs-tools
    - mkdirs: True

inst_xs-tools:
  cmd.run:
    - name: dpkg -i /tmp/xs-tools/xe-*{{ grains['osarch'] }}* > /dev/null
    - unless: test -f /proc/xen/xenbus
    - stateful: True

virt-pkgs:
  pkg.installed:
    - pkgs:
      - imvirt
      - virt-what
