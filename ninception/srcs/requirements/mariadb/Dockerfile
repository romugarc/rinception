FROM debian:buster
RUN	apt update -y && apt upgrade -y
RUN	apt install mariadb-server -y
RUN	sed -i 's/bind-address/bind-address = 0.0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf
EXPOSE	3306
COPY	./database.sh ./
RUN	chmod +x database.sh
ENTRYPOINT	[ "bash","./database.sh"]
