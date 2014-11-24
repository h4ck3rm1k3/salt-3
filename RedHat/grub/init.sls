sed -i '/^timeout/s/5/2/' /boot/grub/grub.conf:
  cmd.run:
    - onlyif: test -f /boot/grub/grub.conf
    - stateful: True
#ubuntu no boot splash, show boot process detail
