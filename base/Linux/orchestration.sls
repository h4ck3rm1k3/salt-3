selinux:
  cmd.run:
    - name: setenforce 0 > dev/null
    - sateful: True

iptables:
  service:
    - dead

yum_repos:
  file.recurse:
    - name: /etc/yum.repos.d
    - source: salt://RedHat/repos
    - template: jinja

yum_proxy:
  file.manged:
    - name: /etc/yum.conf
    - sourece: salt://RedHat/yum.conf
    - template: jinja

python26:
  pkg.installed

salt-minion:
  pkg:
    - installed
  file.managed:
    - name: /etc/salt/minion
    - source: salt://salt/minion/minion.conf.jinja
    - template: jinja
  service:
    - running
    - enable: True
    - reload
    - watch:
      - file: /etc/salt/minion
    - require:
      - file: /etc/salt/minion
      - pkg: salt-minion

xinetd:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - require:
      - pkg: xinetd

check_mk-agent:
  file.managed:
    - name: /etc/yum.repos.d/cmk.repo
    - source: salt://check_mk/cmk.repo.jinja
    - template: jinja
  pkg:
    - installed
    - name: check_mk-agent
    - require:
      - service: xinetd
