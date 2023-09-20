FROM debian:buster
# download all the requierment
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y php7.3 php-fpm php-mysql curl mariadb-client
# curl the wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# move the wp-cli in order to use wp as a command rather than wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
# this config file allow the communication between nginx and wordpress
COPY ./www.conf /etc/php/7.3/fpm/pool.d/www.conf
# the same script copy and right edit
COPY ./wordpress.sh ./wordpress.sh
RUN chmod +x ./wordpress.sh
# create and move to this location inside the docker
WORKDIR /var/www/wordpress

EXPOSE 9000

ENTRYPOINT ["/wordpress.sh"]
