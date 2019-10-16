#!/bin/bash

# run mongodb mysql jupyter 
mkdir ~/workspace
cd ~/workspace
sudo docker-compose up -d

ip=`ip addr | grep 'ens33' | grep 'inet' | cut -d' ' -f 6 | cut -d / -f 1`

sudo docker swarm init --advertise-addr $ip

sudo docker network create --driver overlay --attachable kafka-net

sudo docker stack deploy -c docker-compose-swarm.yml kafka

sudo docker service update --network-add kafka-net kafka_kafka


