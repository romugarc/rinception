FROM debian:buster
# the usual core install of the service
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx openssl
# prepare the directory where the certificate and key will reside
RUN mkdir -p /etc/cert

RUN openssl req \ 
# basic command to generate certificate request
-newkey \
# create a new key that will be use to signed the certificate
rsa:4096 \
# precice the algorythme to use for the key generation and the number of byte use for this algorythm
-nodes \
# no key encryption so no passphrase prompt
-x509 \
# transform the certificate request into a self signed certificate
-days 365 \
# overzrite the default validity time of the self signed certificate from 30 days to 365
-keyout /etc/cert/key.pem \
# tell where to store the generated key
-out /etc/cert/cert.pem \
# tell where to store the certificate
-subj "/C=FR/ST=Rhone/L=Lyon/O=42/OU=jrinna testfloor/CN=www.jrinna.42.fr"
# expose port 443 to the docker network
EXPOSE 443
# copy the nginx conf inside the docker
COPY ./nginx.conf /etc/nginx/conf.d
# launch nginx
CMD ["nginx","-g","daemon off;"]
