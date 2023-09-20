FROM	debian:buster
RUN	apt update -y && apt upgrade -y
RUN	apt-get install wget -y
RUN	apt-get install php7.3 php-fpm php-mysql mariadb-client -y
RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN	chmod +x wp-cli.phar
RUN	mv wp-cli.phar /usr/local/bin/wp
COPY	./www.conf /etc/php/7.3/fpm/pool.d/www.conf
WORKDIR	/var/www/wordpress
COPY	./wp_script.sh ./
RUN	chmod +x ./wp_script.sh
EXPOSE	9000
ENTRYPOINT [ "bash","./wp_script.sh" ]
