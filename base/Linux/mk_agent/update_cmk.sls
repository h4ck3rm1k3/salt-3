cmk_update:
  file:
    - managed
    - name: /opt/omd/sites/dev/check_mk-1.2.5i5p4.tar.gz
    - source: salt://check_mk/check_mk-1.2.5i5p4.tar.gz

extract_files:
  cmd.run:
    - name: tar xf check_mk-1.2.5i5p4.tar.gz
    - stateful: True

update_cmk:
  cmd.run:
    - name: ./setup.sh -q
    - stateful: True

restart_site:
  cmd.run:
    - name: omd restart
    stateful: True
