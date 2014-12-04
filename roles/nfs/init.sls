/media/check_mk:
  mount.mounted:
    - device: server:/srv/repos
    - fstype: nfs
    - mkmnt: True
    - opts:
      - defaults
