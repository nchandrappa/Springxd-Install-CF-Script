#!/bin/sh

sudo yum -y install wget;
sudo yum -y install unzip;
cd /opt;
sudo wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; \
oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz";
sudo tar xzf jdk-7u79-linux-x64.tar.gz;
sudo yum -y install gcc;
sudo alternatives --install /usr/bin/java java /opt/jdk1.7.0_79/bin/java 2