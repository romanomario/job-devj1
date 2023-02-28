#! /bin/bash

path=$(realpath $(dirname $0)/..)
mysql_params="-h mariadb -u root -pdev --default-character-set=utf8mb4"
db_name="dev"

echo "Dropping database $db_name..."
mysql $mysql_params -e "DROP DATABASE IF EXISTS $db_name"

echo "Creating database $db_name..."
mysql $mysql_params -e "CREATE DATABASE $db_name CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci"

echo "Loading schema..."
cat $path/sql/schema.sql | mysql $mysql_params $db_name

echo "Loading dump..."
cat $path/sql/dump.sql | mysql $mysql_params $db_name

exit 0
