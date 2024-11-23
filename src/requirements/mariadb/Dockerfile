FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install nginx -y \
&& apt-get install mariadb-server -y \
&& apt install systemctl -y

EXPOSE 3306

COPY ./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/script.sh /tmp/mariadb/script.sh

#cartella fondamentale da creare che il servizio si aspetta di default per funzionare correttamente
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN chmod +x /tmp/mariadb/script.sh

# ENTRYPOINT [ "mysql" ]
CMD ["/tmp/mariadb/script.sh"]
