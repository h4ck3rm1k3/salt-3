get_alpaca:
  cmd.run:
    - name: git clone git://github.com/gitana/alpaca.git > /dev/null
    - stateful: True

ant-pkgs:
  pkg.installed:
    - names:
      - ant
      - ant-nodeps
