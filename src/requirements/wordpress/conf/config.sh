#!/bin/bash
sleep 15

cd var/www/wordpress

# wp core download --allow-root
#
wp config create	--allow-root \
					--dbname=$MARIA_DB_NAME \
					--dbuser=$MARIA_USER \
					--dbpass=$MARIA_PASSWORD \
					--dbhost=mariadb:3306

wp core install --url="$DOMAIN_NAME" --title="$TITLE" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASSWORD" --admin_email="$ADMIN_EMAIL" --allow-root

echo "user configuration..."
wp user create test testemail@gmail.com --role=author --user_pass=$USER_PASSWORD --allow-root

echo "Wordpress configuration complete."



/usr/sbin/php-fpm7.4 -F
