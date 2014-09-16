xs-tools:
  pkg.installed:
    - names:
      - xe-guest-utilities-xenstore
      - xe-guest-utilities
  file.managed:
    - name: /etc/yum.repos.d/xs-tools.repo
    - source: salt://virt/Xen/RedHat/xs-tools.repo

virt-pkgs:
  pkg.installed:
    - pkgs:
      - imvirt
      - virtdetect
