nsca_client:
  pkg.installed:
    - name: nagios-nsca-client
  file.managed:
    - name: /etc/nagios/send_nsca.cfg
    - source: salt://cmk/agent/nsca/send_nsca.cfg.jinja
    - template: jinja
    - require:
      - pkg: nagios-nsca-client
