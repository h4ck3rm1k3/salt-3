remi_repo:
  file.managed:
    - name: /etc/yum.repos.d/remi.repo
    - source: salt://ocs/remi.repo

ocs-agent:
  pkg.latest:
    - name: ocsinventory-agent
    - skip_verify: True
    - require:
      - file: /etc/yum.repos.d/remi.repo

ocs-conf:
  file.managed:
    - name: /etc/ocsinventory/ocsinventory-agent.cfg
    - source: salt://ocs/ocsinventory-agent.cfg
    - template: jinja
    - mode: 0644
    - require:
      - pkg: ocsinventory-agent
