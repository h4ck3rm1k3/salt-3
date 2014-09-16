#{% if grains['osrelease'] = '6.0.2' %}
#xe host-license-add license-file=/tmp/xs602-2015-1.xslic:
#  cmd.run:
#    - unless: xe host-license-list
#{% endif %}
