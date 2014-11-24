zh_cn_charset:
   - cmd.run:
   - name: echo 'LANG="zh_CN.GB2312"' >> /etc/sysconfig/i18n
   - unless: grep -q zh_CN.GB2312 /etc/sysconfig/i18n
   - stateful: True

samba-server:
  pkg.installed:
    - name: samba
  service:
    - name: smb
    - running: True
    - enable: True
    - reload: True
    - watch:
      - file: /etc/samba/smb.conf
  file.managed:
    - name: /etc/samba/smb.conf
    - source: salt://samba/smb.conf
    - template: jinja
