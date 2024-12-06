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
"/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=lnicoter.42.fr/UID=carlotaccagno"
RUN mkdir -p /var/run/nginx
RUN mkdir -p /var/www/wordpress
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress
#if it is enabled the container will run in the background and you won't
#be able to use the terminal
CMD [ "nginx", "-g", "daemon off;" ]
