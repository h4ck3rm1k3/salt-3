#!/bin/bash
password='gdcloud!.2013'

vncpasswd <<EOF > /dev/null
$password
$password
EOF
