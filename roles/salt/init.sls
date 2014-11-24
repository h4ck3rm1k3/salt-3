include:
  - .{{ grains['os_family'] }}

salt:
  host.present:
    - ip: 192.168.12.7

python-jinja2:
  pkg.installed
