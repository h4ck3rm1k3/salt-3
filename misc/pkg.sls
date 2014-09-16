basic_pkg:
  pkg:
    - installed
    - names:
      - pciutils
      - eject
      - make
      - gcc
      - parted
      - ntfs-3g-devel
      - fuse-devel
      - libxml2-devel
      - p7zip
      - man
      - gettext
      - tree
      - lsof
      - htop
      - itop
      - atop
      - iotop
      - dstat
      - man
      - mlocate
      - tmux
      - tshark
      - dmidecode
      - biosdecode
      - file
      - pidstat
      - perf
      - dtrace
      - stap
      - iostat
      - dstat
      - dtrace
      - blktrace
      - iotop
      - iostat
      - nicstat
      - mpstat
      - tcpdump
      - python-hashlib
      - python-pip
#      - fusionnfs

    - require:
      - sls: sls.repo

#pip_proxy:
    
extra_pkg:
  pkg:
    - installed
    - names:
      - yum-utils
      - check_mk-agent
      - psacct
      - vim
    - require:
      - sls: sls.repo
