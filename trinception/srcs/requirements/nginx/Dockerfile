FROM	debian:buster
RUN	apt-get update -y && apt-get upgrade -y
RUN	apt-get install nginx -y
RUN	apt-get install openssl -y
RUN	mkdir -p /etc/nginx/ssl
RUN	openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -keyout /etc/nginx/ssl/inception.key -out /etc/nginx/ssl/inception.crt -subj "/C=FR/ST=Lyon/L=Lyon/O=42/OU=rgarcia/CN=www.rgarcia.42.fr"
#RUN	mkdir -p /var/run/nginx
EXPOSE	443
COPY	./nginx.conf /etc/nginx/conf.d
CMD	["nginx", "-g", "daemon off;"]
