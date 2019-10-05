#!/bin/sh

set -e

# replace config
sed -i "s/bind 127.0.0.1/bind $CLIENTHOST 127.0.0.1/g" /usr/local/bin/redis.conf
sed -i "s/port 6379/port $CLIENTPORT/g" /usr/local/bin/redis.conf
sed -i "s/# requirepass foobared/requirepass $PASSWORD/g" /usr/local/bin/redis.conf
sed -i "s/# masterauth <masterpassword>/masterauth $PASSWORD/g" /usr/local/bin/redis.conf
sed -i "s/# cluster-enabled yes/cluster-enabled yes/g" /usr/local/bin/redis.conf
sed -i "s/# cluster-config-file nodes-6379.conf/cluster-config-file nodes.config/g" /usr/local/bin/redis.conf
sed -i "s/# cluster-node-timeout 15000/cluster-node-timeout 5000/g" /usr/local/bin/redis.conf

# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
if [ "${1#-}" != "$1" ] || [ "${1%.conf}" != "$1" ]; then
        set -- redis-server "$@"
fi

# allow the container to be started with `--user`
if [ "$1" = 'redis-server' -a "$(id -u)" = '0' ]; then
        find . \! -user redis -exec chown redis '{}' +
        exec gosu redis "$0" "$@"
fi

exec "$@"
