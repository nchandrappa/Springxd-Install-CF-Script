#!/bin/sh

wget http://mirror.cogentco.com/pub/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
tar -xvf zookeeper-3.4.6.tar.gz
sed 's|dataDir=/tmp/zookeeper|dataDir=/root/zookeeper-3.4.6/zookeeper|' < ~/zookeeper-3.4.6/conf/zoo_sample.cfg > ~/zookeeper-3.4.6/conf/zoo.cfg
echo -e "server.1=54.174.33.177:2888:3888\nserver.2=54.172.139.132:2888:3888\nserver.3=52.3.178.218:2888:3888" >> ~/zookeeper-3.4.6/conf/zoo.cfg
mkdir ~/zookeeper-3.4.6/zookeeper
echo "1" >> myid
~/zookeeper-3.4.6/bin/zkServer.sh start