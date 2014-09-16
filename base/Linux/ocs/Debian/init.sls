ocsinventory-agent:
  pkg.installed

ocs-conf:
  file.managed:
    - name: /etc/ocsinventory/ocsinventory-agent.cfg
    - source: salt://ocs/ocsinventory-agent.cfg
    - template: jinja
    - require:
      - pkg: ocsinventory-agent
