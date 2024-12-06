#!/bin/bash
sleep 2

#start mariadbd-safe in the background
mariadbd-safe &

sleep 10
# Create the table
echo "Create the table"
mariadb -u root -p"${MARIA_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${MARIA_DB_NAME}\`;"

# Create the user
echo "Create the user"
mariadb -u root -p"${MARIA_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS \`${MARIA_USER}\`@'localhost' IDENTIFIED BY '${MARIA_PASSWORD}';"

# Grant privileges to the user
echo "Grant privileges to the user"
mariadb -u root -p"${MARIA_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${MARIA_DB_NAME}\`.* TO \`${MARIA_USER}\`@'%' IDENTIFIED BY '${MARIA_PASSWORD}';"

#change the root password to the one set in the environment
# echo "Change the root password"
# mariadb -u root -p"${MARIA_ROOT_PASSWORD}" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIA_ROOT_PASSWORD}';"

#flush privileges to apply changes to all users
echo "Flush privileges"
mariadb -u root -p${MARIA_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

#shutdown the server
echo "Shutdown the server"
mariadb-admin -u root -p"${MARIA_ROOT_PASSWORD}" shutdown

#start the server in safe mode
echo "Start the server in safe mode"
exec mariadbd-safe
