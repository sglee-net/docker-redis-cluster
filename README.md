# Installation guide

## Build and run Redis cluster as a Docker container 
### Check files 
 - docker-composer.yml
 - Dockerfile
 - docker-entrypoint.sh
 - redis.conf
### Run docker-compose
```
 $ sudo docker-compose up --build -d
```

## Create Redis cluster
### Get Docker container id
```
 $ sudo docker ps -a
```
Copy the container id of redis1-
### Check the prepared script
create-redis-cluster.sh should be executable.
Otherwise, run the below
```
 $ chmod +x create-redis-cluster.sh
```
### Run prepared script to make a cluster (Master/Slave)
```
 $ ./create-redis-cluster.sh <container-id>
```
### Run "redis-cli --cluster add-node <from> <to> --cluster-slave" in the case of different servers
reference
 - https://daddyprogrammer.org/post/1601/redis-cluster/

### Connect to Redis
On terminal,
```
 $ sudo docker exec -it <container-id> redis-cli -h <ip> -p <port> -a <passwd>
```
### Check info
```
 $ 192.168.XX.XX:XXXX> info
 # Server
 redis_version:5.0.6
 redis_git_sha1:00000000
 redis_git_dirty:0
 redis_build_id:79574e45aa74bab1
 redis_mode:cluster
 os:Linux 3.10.0-957.27.2.el7.x86_64 x86_64
 arch_bits:64
 ...
```

## Check and Update Firewall
reference
 - https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-using_zones_to_manage_incoming_traffic_depending_on_source
 - https://www.lesstif.com/ws/%EB%84%A4%ED%8A%B8%EC%9B%8D-%EA%B5%AC%EC%84%B1%EA%B3%BC-%EB%B0%A9%ED%99%94%EB%B2%BD/firewalld
 - https://itragdoll.tistory.com/4
```
 $ firewall-cmd --permanent --zone=public --add-service=redis
 $ firewall-cmd --permanent --zone=public --add-port=7001-7006/tcp
 $ firewall-cmd --reload
 $ firewall-cmd --list-all
```

## Configuration of Single Redis
### redis.conf and IP binding
reference
 - https://techmonger.github.io/71/remote-connection/
