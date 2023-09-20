FROM debian:buster
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx openssl
RUN mkdir -p /etc/cert

RUN openssl req \ 
-newkey \
rsa:4096 \
-nodes \
-x509 \
-days 365 \
-keyout /etc/cert/key.pem \
-out /etc/cert/cert.pem \
-subj "/C=FR/ST=Rhone/L=Lyon/O=42/OU=rgarcia/CN=www.rgarcia.42.fr"
EXPOSE 443
COPY ./nginx.conf /etc/nginx/conf.d
CMD ["nginx","-g","daemon off;"]
