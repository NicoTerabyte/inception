#!/bin/bash

echo "Starting MariaDB initialization script"
mysqladmin ping --silent || echo "MariaDB not running yet"

# Start MariaDB service
mysqld

# Check if required environment variables are set
if [ -z "$SQL_DATABASE" ] || [ -z "$SQL_USER" ] || [ -z "$SQL_PASSWORD" ] || [ -z "$SQL_ROOT_PASSWORD" ]; then
    echo "Error: Required environment variables are not set."
    exit 1
fi

# Create database and user, and set root password
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

# Stop MariaDB gracefully
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# Run MariaDB in safe mode in the foreground
exec mysqld_safe
