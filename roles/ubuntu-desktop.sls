minimal-desktop:
  cmd.run:
    - name: aptitude install --without-recommends ubuntu-desktop -y > /dev/null
    - stateful: True
startx:
  cmd.run:
    - name: startx > /dev/null
    - stateful: True
