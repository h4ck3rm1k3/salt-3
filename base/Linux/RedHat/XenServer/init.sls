virt-what:
  pkg.installed

/root/.set_ubuntu_pv_args.sh:
  file.managed:
    - source: salt://RedHat/XenServer/set_ubuntu_pv_args.sh
    - mode: 0755

save_ubuntu_pv_args:
  cmd.run:
    - name: /root/.set_ubuntu_pv_args.sh
    - stateful: True
    - require:
      - file: /root/.set_ubuntu_pv_args.sh

disabl_citrix_repo:
  cmd.run:
    - name: sed -i '/enabled=1/s/1/0/' /etc/yum.repos.d/Citrix.repo
    - onlyif: test -f /etc/yum.repos.d/Citrix.repo
    - stateful: True
