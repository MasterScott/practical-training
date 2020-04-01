# docker run -it --rm --add-host pwnedhub.com:172.17.0.1 -v ~/.nmap:/tmp nmap pwnedhub.com
# docker-compose run nmap pwnedhub.com

FROM alpine:3.11

ENV BUILD_DEPS=""
ENV RUNTIME_DEPS="nmap nmap-scripts"

RUN apk update &&\
    apk add --no-cache $BUILD_DEPS $RUNTIME_DEPS &&\
    apk del $BUILD_DEPS &&\
    rm -rf /var/cache/apk/*

ENTRYPOINT ["nmap"]
