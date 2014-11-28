basic:
  'os:XenServer':
    - match: grains
    - RedHat
    - ntp
    - ipmi
    - cmk.agent
    - salt.minion
    - base_pkgs
