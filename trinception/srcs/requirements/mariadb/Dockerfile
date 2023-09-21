FROM debian:bullseye
RUN	apt-get update -y && apt-get upgrade -y
RUN	apt-get install mariadb-server -y
RUN apt-get install mysql-server
RUN sed -i 's/bind-address/bind-address = 0.0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf
EXPOSE 3306
COPY ./tools/db_script.sh ./
RUN chmod +x db_script.sh
ENTRYPOINT [ "./db_script.sh" ]