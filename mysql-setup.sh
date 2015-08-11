#!/bin/sh

sudo yum -y install mysql
sudo yum -y install mysql-server

sudo service mysqld start
mysql -u root -p

CREATE DATABASE xd

SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root');

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'
WITH GRANT OPTION;