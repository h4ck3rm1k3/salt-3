#python-2.6:
#  pkg:
#    - installed
#zmq-3:
#  pkg:
#    - name: python-zmq-3.2*
#    - installed
common:
  pkg.installed:
    - wget
    - chkconfig
    - vim-enhanced
    - screen
    - curl
    - ntpdate
    - ntpd
#    - openntpd
cmk_plugins:
  pkg.installed:
    - xinetd
    - dmidecode
    - dstat
    - iotop
    - iftop
    - iptraf
    - innotop
    - agedu
    - ncdu
    - pciutils
    - ethtool
#misc:
#  pkg.installed:
#    - supervise
#    - sos
#    - source://
#    - monit
#devtools:
#role-log
#role-web
#role-db
#role-backup
#role-ftp
#role-iscsi
#role-nfs
#role-smb
#role-java
#role-nagios
#role-cacti
#role-salt
#role-svn
#role-git
#role-freenx
#minimal-desktop:
#minimal-server:
