FROM debian:bullseye
RUN apt-get update -y && apt-get upgrade -y && apt-get -y install wget
RUN apt-get install -y php7.4 \
	php-fpm\
	php-mysql\
	mariadb-client
RUN wget https://fr.wordpress.org/wordpress-6.7-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.7-fr_FR.tar.gz && rm wordpress-6.7-fr_FR.tar.gz
RUN		chown -R root:root /var/www/wordpress
COPY	/conf/php.ini /etc/php/7.4/cli/php.ini
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY ./conf/config.sh /tmp/wordpress/config.sh
RUN chmod +x /tmp/wordpress/config.sh
# CMD [ "/tmp/wordpress/config.sh" ]
