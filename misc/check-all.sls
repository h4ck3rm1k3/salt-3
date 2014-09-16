ping -c 3 salt:
  cmd.run
ping -c 3 squid:
  cmd.run
ping -c 3 ftp01:
  cmd.run
ping -c 3 netflow:
  cmd.run
ping -c 3 nagios01:
  cmd.run
ping -c 3 ntp:
  cmd.run
salt-call --version-repot:
  cmd.run
