roles:
{% if grains['id'].startswith('dns') %}
  - dns
{% elif grains['id'].startswith('ntp') %}
  - ntp
{% elif grains['id'].startswith('mail') %}
  - mail
{% elif grains['id'].startswith('squid') %}
  - squid
{% elif grains['id'].startswith('rack') %}
  - rack
{% elif grains['id'].startswith('backup') %}
  - backup
{% elif grains['id'].startswith('ldap') %}
  - ldap
{% elif grains['id'].startswith('ftp') %}
  - ftp
{% elif grains['id'].startswith('syslog') %}
  - syslog
{% elif grains['id'].startswith('nagios') %}
  - nagios
{% elif grains['id'].startswith('salt') %}
  - salt
{% else %}
{% endif %}
