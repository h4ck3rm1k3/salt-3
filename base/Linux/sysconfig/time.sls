Asia/Shanghai:
  timezone.system:
    - utc: False

hwclock -w:
  cmd.run:
    - onlyif: test -f /dev/rtc
    - stateful: True
