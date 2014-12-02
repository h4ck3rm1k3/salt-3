ipmi-pkgs:
  pkg.installed
    - pkgs:
      - freeipmi
      - ipmitool
      - bind-utils

rmcpping:
  file.managed:
    - name: /opt/omd/sites/check_rcmpping

#omd:
  #  pkg.installed:
    #  - name: 
