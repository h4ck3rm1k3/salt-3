{% if grains['os_family'] == 'RedHat' %}
  nagios_plugins_all: nagios-plugins-all
  ntp: ntp
{% endif %}

{% if grains['os_family'] == 'Debian' %}
  nagios_plugins_all: nagios-plugins
  ntp: openntpd
{% endif %}

{% if grains['osarch'] == 'i686' %}
  nagios_plugin_path: /usr/lib/nagios/plugins
  base_arch: i386
{% endif %}

{% if grains['osarch'] == 'x86_64' %}
  nagios_plugin_path: /usr/lib64/nagios/plugins
  basearch: x86_64
{% endif %}
