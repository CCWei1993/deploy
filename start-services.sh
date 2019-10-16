#!/bin/bash

# run mongodb mysql jupyter 
mkdir ~/workspace
cd ~/workspace
sudo docker-compose up -d

sudo docker swarm init --advertise-addr 192.168.211.135

sudo docker network create --driver overlay --attachable kafka-net

sudo docker stack deploy -c docker-compose-swarm.yml kafka

sudo docker service update --network-add kafka-net kafka_kafka


