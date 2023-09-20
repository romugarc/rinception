FROM debian:buster
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server
RUN sed -i 's/bind-address/bind-address = 0.0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf
EXPOSE 3306
COPY ./mariadb.sh ./
RUN chmod +x mariadb.sh
ENTRYPOINT [ "./mariadb.sh" ]