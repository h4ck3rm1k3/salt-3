{% if grains['osrelease'][0] == '6' %}
sed -i '/releasever/s/\$releasever/6/' /etc/yum.repos.d/*:
  cmd.run:
    - stateful: True
    - require:
      - file: yum_repos

{% elif grains['osrelease'][0] == '5' %}
sed -i '/releasever/s/\$releasever/5/' /etc/yum.repos.d/*:
  cmd.run:
    - stateful: True

{% endif %}
