freeipmi:
  pkg.installed

rmcpping:
  file.managed:
    - name: /opt/omd/sites/check_rcmpping

omd:
  pkg.installed:
    - name: 
