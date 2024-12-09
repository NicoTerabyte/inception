# .PHONY: setup

all: setup

# Add other targets as needed

.PHONY: setup

setup:
	@cd src && echo "#!/bin/bash" > generate_env.sh
	@cd src && echo "DOMAIN_NAME=lnicoter.42.fr" >> generate_env.sh
	@cd src && echo "read -p \"maria root password: \" MARIA_ROOT_PASSWORD" >> generate_env.sh
	@cd src && echo "read -p \"maria password: \" MARIA_PASSWORD" >> generate_env.sh
	@cd src && echo "read -p \"maria user: \" MARIA_USER" >> generate_env.sh
	@cd src && echo "read -p \"maria db name: \" MARIA_DB_NAME" >> generate_env.sh
	@cd src && echo "WORDPRESS_DB_HOST=mariadb:3306" >> generate_env.sh
	@cd src && echo "WORDPRESS_DB_USER=npc" >> generate_env.sh
	@cd src && echo "read -p \"user password: \" USER_PASSWORD" >> generate_env.sh
	@cd src && echo "read -p \"wordpress db name: \" WORDPRESS_DB_NAME" >> generate_env.sh
	@cd src && echo "read -p \"title: \" TITLE" >> generate_env.sh
	@cd src && echo "read -p \"admin user: \" ADMIN_USER" >> generate_env.sh
	@cd src && echo "read -p \"admin password: \" ADMIN_PASSWORD" >> generate_env.sh
	@cd src && echo "ADMIN_EMAIL=lnicoter@gmail.com" >> generate_env.sh
	@cd src && echo "" >> generate_env.sh
	@cd src && echo "cat <<EOL > .env" >> generate_env.sh
	@cd src && echo "DOMAIN_NAME=\$$DOMAIN_NAME" >> generate_env.sh
	@cd src && echo "MARIA_ROOT_PASSWORD=\$$MARIA_ROOT_PASSWORD" >> generate_env.sh
	@cd src && echo "MARIA_USER=\$$MARIA_USER" >> generate_env.sh
	@cd src && echo "MARIA_DB_NAME=\$$MARIA_DB_NAME" >> generate_env.sh
	@cd src && echo "MARIA_PASSWORD=\$$MARIA_PASSWORD" >> generate_env.sh
	@cd src && echo "WORDPRESS_DB_HOST=\$$WORDPRESS_DB_HOST" >> generate_env.sh
	@cd src && echo "WORDPRESS_DB_USER=\$$WORDPRESS_DB_USER" >> generate_env.sh
	@cd src && echo "USER_PASSWORD=\$$USER_PASSWORD" >> generate_env.sh
	@cd src && echo "WORDPRESS_DB_NAME=\$$WORDPRESS_DB_NAME" >> generate_env.sh
	@cd src && echo "TITLE=\$$TITLE" >> generate_env.sh
	@cd src && echo "ADMIN_USER=\$$ADMIN_USER" >> generate_env.sh
	@cd src && echo "ADMIN_PASSWORD=\$$ADMIN_PASSWORD" >> generate_env.sh
	@cd src && echo "ADMIN_EMAIL=\$$ADMIN_EMAIL" >> generate_env.sh
	@cd src && echo "EOL" >> generate_env.sh
	@cd src && echo "echo \".env file created successfully.\"" >> generate_env.sh
	@cd src && chmod +x generate_env.sh
	@cd src && ./generate_env.sh
	@cd src && rm generate_env.sh
	@make up
up :
	@sudo docker compose -f ./src/docker-compose.yml up --build

down :
	@sudo docker compose -f ./src/docker-compose.yml down

stop :
	@sudo docker compose -f ./src/docker-compose.yml stop

start :
	@sudo docker compose -f ./src/docker-compose.yml start

status :
	@sudo docker ps
fclean :
	@sudo docker compose -f ./src/docker-compose.yml down -v --rmi all
	@sudo rm -rf /home/lnicoter/data/mariadb/* /home/lnicoter/data/wordpress/*
prune :
	@sudo docker system prune -af
