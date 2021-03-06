yum_repos:
  file.recurse:
    - name: /etc/yum.repos.d
    - source: salt://repos/files

{% if grains['os'] == 'RedHat' %}
sed -i '/releasever/s/\$releasever/6/' /etc/yum.repos.d/*:
  cmd.run:
    - stateful: True
    - require:
      - file: yum_repos
{% elif grains['os'] == 'XenServer' %}
sed -i '/releasever/s/\$releasever/5/' /etc/yum.repos.d/*:
  cmd.run:
    - stateful: True
    - require:
      - file: yum_repos
{% elif grains['osrelease'][0] == '5' %}
sed -i '/releasever/s/\$releasever/5/' /etc/yum.repos.d/*:
  cmd.run:
    - stateful: True
{% endif %}

refresh_db:
  cmd.run:
    - name:  yum clean all > /dev/null && yum makecache > /dev/null
    - stateful: True
    - watch:
      - file: yum_repos
