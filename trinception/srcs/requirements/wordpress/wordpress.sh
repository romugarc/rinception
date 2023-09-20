#!/bin/bash
if [ ! -f "/var/www/wordpress/wp-config.php" ]
then
	sleep 15
	while ! mysql -h mariadb --user=${DB_USER} --password=${DB_USER_PASSWORD} -e "SELECT schema_name FROM information_schema.schemata WHERE schema_name='$DB_NAME'"; do
  		sleep 5
	done

	echo "Starting installation wordpress"
	wp core download --allow-root
	wp config create --allow-root --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_USER_PASSWORD} --dbhost=${DB_HOST} --force
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD} --role=subscriber
	wp theme install riverbank --allow-root --activate

else
	echo "No need to install wordpress, the volume as been retrieved"
fi

service php7.3-fpm start && service php7.3-fpm stop
php-fpm7.3 -F