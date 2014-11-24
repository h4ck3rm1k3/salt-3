{% if grains['os_family'] == 'RedHat' %}
freenx-repo:
  file.managed:
    - name: /etc/yum.repos.d/misc.repo
    - source: salt://service/freenx/misc.repo

nomachine:
  pkg.installed

teamviewer.i686:
  pkg.installed

{% elif grains['os_family'] == 'Debian' %}

freenx-deb:
  file.managed:
    - name: /tmp/nomachine_4.2.27_1_amd64.deb
  cmd.run:
    - name: dpkg -i /tmp/nomachine_4.2.27_1_amd64.deb > /dev/null
    - unless: dpkg -l | grep -i nomachine
    - stateful: True
{% endif %}
