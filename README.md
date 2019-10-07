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
### Run prepared script
```
 $ ./create-redis-cluster.sh <container-id>
```

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
