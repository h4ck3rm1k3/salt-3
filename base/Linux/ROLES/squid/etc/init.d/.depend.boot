TARGETS = screen-cleanup apparmor urandom
INTERACTIVE =
urandom: umountfs umountnfs.sh sendsigs
