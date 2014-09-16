yum_repos:
  file.recurse:
    - name: /etc/yum.repos.d
    - source: salt://RedHat/repos/files

yum_clean_all:
  cmd.run:
    - name: yum clean all > /dev/null
    - watch:
      - file: yum_repos
    - stateful: True

yum_makcache:
  cmd.wait:
    - name: yum makecache > /dev/null
    - require:
      - sls: yum_clean_all
    - stateful: True
