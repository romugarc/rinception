FROM debian:bullseye
RUN	apt-get update -y && apt-get upgrade -y
RUN	apt-get install wget -y
RUN	apt-get install php7.4 php-fpm php-mysql mariadb-client -y
RUN	wget https://github.com/wp-cli/wp-cli/releases/download/v2.7.0/wp-cli-2.7.0.phar
RUN chmod +x wp-cli.phar && mv wp-cli-2.7.0.phar /usr/local/bin/wp
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/wp_script.sh ./wp_script.sh
RUN chmod +x ./wp_script.sh
WORKDIR /var/www/wordpress
EXPOSE 9000
ENTRYPOINT ["/wp_script.sh"]
