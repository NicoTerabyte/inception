all : up

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
