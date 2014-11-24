mount-tmpl:
mount-secstor:
inst-tmplt:
  cmd.run:
    - name: /usr/lib64/cloud/agent/scripts/storage/secondary/cloud-install-sys-tmplt -m /mnt/secondary -f /mnt/nfs/isos/hypervisor/cloudstack/acton-systemvm-02062012.vhd.bz2 -h xenserver -e vhd
    - stateful: True
