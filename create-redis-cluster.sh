#!/bin/bash

echo yes | sudo docker exec -i $1 redis-cli -h 192.168.0.41 -p 7001 -a 1111 --cluster create 192.168.0.41:7001 192.168.0.41:7002 192.168.0.41:7003 192.168.0.41:7004 192.168.0.41:7005 192.168.0.41:7006 --cluster-replicas 1
