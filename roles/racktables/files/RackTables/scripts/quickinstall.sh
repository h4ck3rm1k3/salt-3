#!/bin/sh

# Author:  colin.coe@gmail.com
# Date:    Sep 7, 2009
# Updated: Sep 10, 2009
# Purpose: Simple quickstart script
# License: Create Commons Attribution-Share Alike 3.0 Unported

if [ `id -u` -ne 0 ]; then
  echo This script must be run as root, exiting...
  exit 1
fi

service mysqld status > /dev/null 2>&1
if [ $? -ne 0 ]; then
  /sbin/service mysqld start
  /sbin/chkconfig mysqld on
fi

service httpd status > /dev/null 2>&1
if [ $? -ne 0 ]; then
  /sbin/service httpd start
  /sbin/chkconfig httpd on
else
  /sbin/service httpd reload
fi

RT_DB_USER=rackuser
RT_DB_PASS=rackpw

echo 
echo "The default DB username for RackTables is '${RT_DB_USER}'"
echo "If you want to change the username, enter a new username or just press enter"
read USER
echo "The default DB password for RackTables is '${RT_DB_PASS}'"
echo "If you want to change the username, enter a new username or just press enter"
read PASS

[ -n "${USER}" ] && RT_DB_USER="${USER}"
[ -n "${PASS}" ] && RT_DB_PASS="${PASS}"

sed -e "s/'username'/'${RT_DB_USER}'/" -e "s/'password'/'${RT_DB_PASS}'/" /usr/share/RackTables/inc/secret-sample.php > /usr/share/RackTables/inc/secret.php

echo -e "You need the MySQL root password to continue.  If you don't know it, ^C here and\ncome back when you have the password."
echo
echo Enter MySQL root password
mysql -uroot -p -e "
create database racktables;
grant all on racktables.* to root;
grant all on racktables.* to root@localhost;
grant all on racktables.* to ${RT_DB_USER};
grant all on racktables.* to ${RT_DB_USER}@localhost;
set password for ${RT_DB_USER}@localhost=password('${RT_DB_PASS}');
exit"
echo
echo
echo You should be able to browse to http://`hostname`/racktables/install.php
echo to complete the installation.

exit 0
