#!/bin/bash

echo "Starting MariaDB initialization script"

# Ensure necessary directories exist
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

# Start MariaDB directly in safe mode in the background
mysqld_safe --datadir=/var/lib/mysql &
echo "Waiting for MariaDB to start..."
until mysqladmin ping --silent; do
    sleep 1
done
echo "MariaDB is running."

# Set default values for environment variables if not provided
SQL_DATABASE=${SQL_DATABASE:-testdb}
SQL_USER=${SQL_USER:-testuser}
SQL_PASSWORD=${SQL_PASSWORD:-testpassword}
SQL_ROOT_PASSWORD=${SQL_ROOT_PASSWORD:-rootpassword}

# Initialize database
echo "Initializing database..."
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

echo "MariaDB initialization complete."

# Keep MariaDB running in the foreground
wait
