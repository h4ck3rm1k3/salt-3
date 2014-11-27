remi_repo:
  file.managed:
    - name: /etc/yum.repos.d/remi.repo
    - source: salt://ocs/remi.repo

ocs_agent-pkg:
  pkg.latest:
    - name: ocsinventory-agent
    - skip_verify: True
    - require:
      - file: /etc/yum.repos.d/remi.repo

ocs_agent-conf:
  file.managed:
    - name: /etc/ocsinventory/ocsinventory-agent.cfg
    - source: salt://ocs/ocsinventory-agent.cfg.jinja
    - template: jinja
    - mode: 0644
    - require:
      - pkg: ocsinventory-agent
