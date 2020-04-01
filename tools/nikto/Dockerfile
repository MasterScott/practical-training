# docker run -it --rm --add-host pwnedhub.com:172.17.0.1 -v ~/.nikto:/tmp nikto -h http://pwnedhub.com -o /tmp/nikto.html -Format htm
# docker-compose run nikto -h http://pwnedhub.com -o /tmp/nikto.html -Format htm

FROM alpine:3.11

ENV BRANCH="master"
ENV COMMIT="HEAD"

ENV BUILD_DEPS="git"
ENV RUNTIME_DEPS="perl perl-net-ssleay"

RUN apk update &&\
    apk add --no-cache $BUILD_DEPS $RUNTIME_DEPS &&\
    git clone --branch=$BRANCH https://github.com/sullo/nikto.git nikto &&\
    cd nikto &&\
    git reset --hard $COMMIT &&\
    apk del $BUILD_DEPS &&\
    rm -rf /nikto/.git &&\
    rm -rf /var/cache/apk/*

WORKDIR /nikto

ENTRYPOINT ["./program/nikto.pl"]
