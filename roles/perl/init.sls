/usr/bin/cpanm:
  file.managed:
    - source: salt://perl/cpanm
    - mode: 0755
