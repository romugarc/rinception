FROM debian:buster
# install the core program
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server
# tell mariadb to listen on all ip address
RUN sed -i 's/bind-address/bind-address = 0.0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf
# expose the port 3306 for the docker network
EXPOSE 3306
# copy the script inside the docker
COPY ./mariadb.sh ./
# make sure that the script can be executed
RUN chmod +x mariadb.sh
# execute the script inside the docker
ENTRYPOINT [ "./mariadb.sh" ]