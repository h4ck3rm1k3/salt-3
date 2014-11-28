{% if grains['manufacturer'] == 'Xen' and grains['os_family'] == 'RedHat' %}
xs-tools:
  pkg.installed:
    - names:
      - xe-guest-utilities-xenstore
      - xe-guest-utilities
  file.managed:
    - name: /etc/yum.repos.d/xs-tools.repo
    - source: salt://virt/xs-tools.repo

{% endif %}

virt-pkgs:
  pkg.installed:
    - pkgs:
      - imvirt
      - virtdetect
