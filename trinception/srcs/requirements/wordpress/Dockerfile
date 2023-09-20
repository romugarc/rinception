FROM debian:buster
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y php7.3 php-fpm php-mysql curl mariadb-client
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
COPY ./www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./wp_script.sh ./wp_script.sh
RUN chmod +x ./wp_script.sh
WORKDIR /var/www/wordpress

EXPOSE 9000

ENTRYPOINT ["/wp_script.sh"]
