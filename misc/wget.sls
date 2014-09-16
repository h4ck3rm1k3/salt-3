wget:
  pkg.installed
/etc/wgetrc:
  file:
     - managed
     - source: salt://etc/wgetrc
     - mode: 644
