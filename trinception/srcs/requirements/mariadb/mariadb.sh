#!/bin/bash
if [ ! -d "/var/lib/mysql/${MARIADB_NAME}" ]
then

	service		mysql start
	sleep 5
	mysql -e 	"CREATE DATABASE ${MARIADB_NAME};"
	mysql -e	"CREATE USER '${MARIADB_USR}'@'%' IDENTIFIED BY '${MARIADB_USR_PWD}';"
	mysql -e	"GRANT ALL PRIVILEGES ON ${MARIADB_NAME}.* TO '${MARIADB_USR}'@'%' IDENTIFIED BY '${MARIADB_USR_PWD}' WITH GRANT OPTION;"
	mysql -e	"FLUSH PRIVILEGES;"
	sed -i		"s/password = /password = ${MARIADB_ROOT_PWD} #/" /etc/mysql/debian.cnf
	mysql -e	"ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PWD}'"
	service		mysql stop
else
	echo "No need to create database, the old one was retrieved"
fi

mysqld_safe