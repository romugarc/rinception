#!/bin/bash
service mysql start
mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}' @ '%' IDENTIFIED BY '${DB_USER_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}' @ '%' IDENTIFIED BY '${DB_USER_PASSWORD}' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"
sed -i		"s/password = /password = ${DB_ROOT_PASSWORD} #/" /etc/mysql/debian.cnf
mysql -e "ALTER USER 'root' @ 'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
service mysql stop
mysqld_safe
