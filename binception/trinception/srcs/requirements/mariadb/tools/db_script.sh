#!/bin/bash
if [ ! -d "/var/lib/mysql/${DB_NAME}" ]
then

	service		mysql start
	sleep 5
	mysql -e 	"CREATE DATABASE ${DB_NAME};"
	mysql -e	"CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}';"
	mysql -e	"GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}' WITH GRANT OPTION;"
	mysql -e	"FLUSH PRIVILEGES;"
	sed -i		"s/password = /password = ${DB_USER_PASSWORD} #/" /etc/mysql/debian.cnf
	mysql -e	"ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_USER_PASSWORD}'"
	service		mysql stop
else
	echo "No need to create database, the old one was retrieved"
fi

mysqld_safe