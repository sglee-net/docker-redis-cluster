FROM redis:5.0.6

MAINTAINER SGLee (sglee@vcanus.com)

WORKDIR /usr/local/bin/

ARG EXPOSEPORT

RUN rm -rf ./docker-entrypoint.sh
ADD redis.conf ./redis.conf
ADD docker-entrypoint.sh ./docker-entrypoint.sh
RUN chmod 755 ./redis.conf
RUN chmod 755 ./docker-entrypoint.sh

RUN chown redis:redis ./redis.conf
RUN chown redis:redis ./docker-entrypoint.sh

#EXPOSE ${EXPOSEPORT} 

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["redis-server","./redis.conf"]
