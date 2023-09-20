#!/bin/bash
# check if the database as been retrieved 
if [ ! -d "/var/lib/mysql/${MARIADB_NAME}" ]
then

	echo "creating a new database"
	# start mysql
	service		mysql start
	# wait for mysql to finish starting
	sleep 5
	# create a new database the -e flag simulate opening the database and running the command inside without having to do it
	mysql -e 	"CREATE DATABASE ${MARIADB_NAME};"
	# create a user for the database
	mysql -e	"CREATE USER '${MARIADB_USR}'@'%' IDENTIFIED BY '${MARIADB_USR_PWD}';"
	# self explanatory
	mysql -e	"GRANT ALL PRIVILEGES ON ${MARIADB_NAME}.* TO '${MARIADB_USR}'@'%' IDENTIFIED BY '${MARIADB_USR_PWD}' WITH GRANT OPTION;"
	# update all privileges
	mysql -e	"FLUSH PRIVILEGES;"
	# set the root password inside the debian.cnf flag to be able to restart mysql as root
	sed -i		"s/password = /password = ${MARIADB_ROOT_PWD} #/" /etc/mysql/debian.cnf
	# prevent root ability to start mysql without entering his password
	mysql -e	"ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PWD}'"
	# stop mysql in order to restart it the propoer way as said in the official documentation
	service		mysql stop
else
	echo "No need to create database, the old one was retrieved"
fi
# start mysql the proper way
mysqld_safe