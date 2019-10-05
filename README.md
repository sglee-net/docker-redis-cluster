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
