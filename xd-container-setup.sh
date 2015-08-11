#!/bin/sh

sudo mkdir /opt/pivotal
sudo wget https://repo.spring.io/libs-release/org/springframework/xd/spring-xd/1.2.0.RELEASE/spring-xd-1.2.0.RELEASE-dist.zip
sudo unzip spring-xd-1.2.0.RELEASE-dist.zip
sudo echo "export XD_HOME=/opt/pivotal/spring-xd-1.2.0.RELEASE/xd" >> ~/.bash_profile
sudo echo "export PATH=$XD_HOME/bin" >> ~/.bash_profile
sudo source ~/.bash_profile

sudo sed '12,13 s/#//' /opt/pivotal/spring-xd-1.2.0.RELEASE/xd/config/servers.yml
sudo sed -e '301,304 s/#//' -e '304 s/connect\: [A-Za-z0-9]*/connect\: 54.174.33.177:2181,54.172.139.132:2181,52.3.178.218:2181/' \
/opt/pivotal/spring-xd-1.2.0.RELEASE/xd/config/servers.yml
sudo sed -e '277,279 s/#//' -e '279 s/addresses\: [A-Za-z0-9:]*/addresses\: 54.174.33.177:5672/' /opt/pivotal/spring-xd-1.2.0.RELEASE/xd/config/servers.yml
sudo sed '139,145 s/#//' /opt/pivotal/spring-xd-1.2.0.RELEASE/xd/config/servers.yml
sudo sed '141 s/url\: [A-Za-z0-9\/\:]*/url\: jdbc\:mysql\:\/\/54.172.139.132:3306\/yourDB/' /opt/pivotal/spring-xd-1.2.0.RELEASE/xd/config/servers.yml
sudo sed '142 s/username\: [A-Za-z0-9]*/username\: admin1/' /opt/pivotal/spring-xd-1.2.0.RELEASE/xd/config/servers.yml
sudo sed '143 s/password\: [A-Za-z0-9]*/password\: admin1/' /opt/pivotal/spring-xd-1.2.0.RELEASE/xd/config/servers.yml
sudo sed -e '139,145 s/#//' \
-e '141 s/url\: [A-Za-z0-9\/\:]*/url\: jdbc\:mysql\:\/\/54.172.139.132:3306\/yourDB/' \
-e '142 s/username\: [A-Za-z0-9]*/username\: admin1/' \
-e '143 s/password\: [A-Za-z0-9]*/password\: admin1/' /opt/pivotal/spring-xd-1.2.0.RELEASE/xd/config/servers.yml

wget http://mirrors.dotsrc.org/mysql/Downloads/Connector-J/mysql-connector-java-5.1.36.zip
unzip mysql-connector-java-5.1.36.zip
sudo cp mysql-connector-java-5.1.36/mysql-connector-java-5.1.36.jar /opt/pivotal/spring-xd-1.2.0.RELEASE/xd/lib

sudo nohup xd-container &