FROM debian:buster
RUN	apt update -y && apt upgrade -y
RUN	apt install mariadb-server -y
COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
EXPOSE	3306
COPY	./database.sh ./
RUN	chmod +x database.sh
ENTRYPOINT	[ "bash","./database.sh"]
