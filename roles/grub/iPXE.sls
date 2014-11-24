/boot/ipxe.lkrn:
  file.managed:
    - source: salt://service/grub/ipxe.lkrn
    - mkdirs: True
    - clean: True

/boot/grub/grub.conf:
  file.managed:
    - source: salt://service/grub/iPXE.conf
    - template: jinja
    - require:
      - file: /boot/ipxe.lkrn

default_menu:
  cmd.run:
    - name: sed -i '/^default/s/0/1/' /boot/grub/grub.conf
    - require:
      - file: /boot/grub/grub.conf
