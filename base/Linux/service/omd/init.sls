{% if grains['os_family'] == 'Debian' %}
omd-pkg:
  cmd.run:
    - name: wget -q -P /opt http://ftp01/srv/apt-mirror/omd/x86_64/omd-1.21-nc.20140909.deb
    - unless: test -f /opt/omd-1.21-nc.20140909.deb
    - stateful: True

omd_install:
  cmd.run:
    - name: dpkg -i /opt/omd-1.21-nc.20140909.x86_64.deb > /dev/null
    - unless: dpkg -l | grep -q omd-1.21-nc.20140909
    - stateful: True
    - require:
      - sls: omd-pkg

{% elif grains['os_family'] == 'RedHat' %}
omd_repo:
  file.managed:
    - name: /etc/yum.repos.d/omd.repo
    - source: salt://service/omd/omd.repo

omd_install:
  pkg.installed:
    - name: omd-1.21-nc.20140909
    - require:
      - file: /etc/yum.repos.d/omd.repo

{% endif %}

create_omd_site01:
  cmd.run:
    - name: omd ceate site01 > /dev/null
    - unless: omd sites | grep -q site01
    - stateful: True
    - require:
      - sls: omd_install

#start_site01:
#  cmd.wait:
#    - name: omd start site01 > /dev/null
#    - unless: omd status | grep -q site01
#    - stateful: True
#     - require:
#       - cmd: create_omd_site01
