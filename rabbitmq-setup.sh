#!/bin/sh

wget https://www.rabbitmq.com/releases/erlang/erlang-17.4-1.el6.x86_64.rpm
sudo yum -y install erlang-17.4-1.el6.x86_64.rpm
wget https://www.rabbitmq.com/releases/rabbitmq-server/v3.5.3/rabbitmq-server-3.5.3-1.noarch.rpm
sudo rpm --import https://www.rabbitmq.com/rabbitmq-signing-key-public.asc
sudo yum -y install rabbitmq-server-3.5.3-1.noarch.rpm
sudo rabbitmq-plugins enable rabbitmq_management
sudo rabbitmqctl add_user root root
sudo rabbitmqctl set_user_tags root administrator
cd /etc/rabbitmq/
echo "[{rabbit, [{loopback_users, []}]}]." >> rabbitmq.config
cd ~
sudo rabbitmq-server