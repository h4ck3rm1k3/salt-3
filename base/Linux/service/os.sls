mk_tmp:
  cmd.run:
    - name: mkdir /boot/tmp
    - unless: test -d /boot/tmp
    - stateful: True

/boot/tmp/vmlinuz:
  file.managed:
    - source: http://192.168.11.8/os/Linux/RedHat/CentOS/x86_64/6.5/images/pxeboot/vmlinuz
    - require:
      - cmd: mk_tmp
    
/boot/tmp/initrd.img:
  file.managed:
    - source: http://192.168.11.8/os/Linux/RedHat/CentOS/x86_64/6.5/images/pxeboot/initrd.img
    - require:
      - file: /boot/tmp/initrd.img

/boot/grub/grub.conf:
  file.managed:
    - source: salt://service/grub.conf.jinja
    - template: jinja
    - defalt:
      - OS: CentOS
      - VER: 6.5
      - ARCH: x86_64
    - require:
      - file: /boot/tmp/initrd.img

reboot_sys:
  cmd.run:
    - name: reboot > /dev/null
    - require:
      - file: /boot/grub/grub.conf
