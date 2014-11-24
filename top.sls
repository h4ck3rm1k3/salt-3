include:
  - {{ grains['os_family'] }}
  - sysconfig.time
  - ntp
  - ocs

basic_utils:
  pkg.installed:
    - pkgs:
      - man
      - file
      - lsof
      - tcping
      - dmidecode
      - curl
      - vim

basic_utils:
  pkg.installed:
    - pkgs:
      - man
      - file
      - lsof
      - tcping
      - dmidecode
      - curl
      - vim
