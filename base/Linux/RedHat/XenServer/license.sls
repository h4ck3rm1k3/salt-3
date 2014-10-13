{% if grains['osrelease'] == '6.0.2' %}
add_license:
  file.managed:
    - name: /tmp/xs602-2015-1.xslic
    - source: salt://{{ grains['os_family'] }}/{{ grains['os'] }}//xs602-2015-1.xslic
  cmd.run:
    - name: xe host-license-add license-file=/tmp/xs602-2015-1.xslic > /dev/null
    - unless: xe host-license-view | awk '/serialnumber/ { print $NF}' | grep -q [a-z]
    - stateful: True
{% endif %}
