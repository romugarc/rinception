#!/bin/bash
# check if a wordpress site as been found if not then
if [ ! -f "/var/www/wordpress/wp-config.php" ]
then
	# wait for the restart of the database
	sleep 15
	# check if can connect to the database
	while ! mysql -h mariadb --user=${MARIADB_USR} --password=${MARIADB_USR_PWD} -e "SELECT schema_name FROM information_schema.schemata WHERE schema_name='$MARIADB_NAME'"; do
  		echo "Waiting for database to be created..."
		# legacy sleep useless now
  		sleep 5
	done

	echo "Starting installation wordpress"
	# download wordpress
	wp core download --allow-root
	# link the wordpress site with the database
	wp config create --allow-root --dbname=${MARIADB_NAME} --dbuser=${MARIADB_USR} --dbpass=${MARIADB_USR_PWD} --dbhost=${MARIADB_HOST} --force
	# create the damin user
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USR} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL}
	# create a test user
	wp user create --allow-root ${WP_TEST_USR} ${WP_TEST_EMAIL} --user_pass=${WP_TEST_PWD} --role=subscriber
	# install a nice theme
	wp theme install riverbank --allow-root --activate

else
	echo "No need to install wordpress, the volume as been retrieved"
fi
# start stop and restart wordpress just to be sure
service php7.3-fpm start && service php7.3-fpm stop
php-fpm7.3 -F