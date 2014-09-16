include:
  - .{{ grains['os_family']}}

ntp:
  hosts.present:
    - ip: 10.24.4.10
