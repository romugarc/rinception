#!/bin/bash
if [ ! -f "./wp-config.php" ]
then
	while [ ! mysql -h mariadb --user=${DB_USER} --password=${DB_USER_PASSWORD} -e "SELECT schema_name FROM information_schema.schemata WHERE schema_name='$DB_NAME';" ] 
	do
		sleep 5
	done

	wp core download --allow-root
	wp config create --allow-root --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=$(DB_USER_PASSWORD) --dbhost=${DB_HOST} --path='/var/www/wordpress'
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD} --role=subscriber
	wp theme activate --allow-root
fi
