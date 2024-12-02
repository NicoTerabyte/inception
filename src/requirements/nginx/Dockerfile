#this is the part where i create the system from 0
#and then i install manually with the run command nginx
#BUT before trying to build nginx manually i need to understand what is
#nginx in the first place :=()
FROM debian:bullseye
RUN apt update -y && apt upgrade -y && apt install nginx -y
RUN apt install vim -y
RUN apt install curl -y
RUN apt install openssl -y
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj \
"/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
#if it is enabled the container will run in the background and you won't
#be able to use the terminal
CMD [ "nginx", "-g", "daemon off;" ]
