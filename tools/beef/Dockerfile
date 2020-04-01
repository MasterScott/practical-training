# docker run -it --rm -p 3000:3000 -p 6789:6789 -p 61985:61985 -p 61986:61986 -v ~/.beef:/root/.beef beef
# docker-compose run beef

FROM ruby:2.7-alpine

ENV BRANCH="master"
ENV COMMIT="HEAD"

ENV BUILD_DEPS="git bash"
ENV RUNTIME_DEPS=""

ENV LANG="C.UTF-8"

RUN apk update &&\
    apk add --no-cache $BUILD_DEPS $RUNTIME_DEPS &&\
    git clone --branch=$BRANCH https://github.com/beefproject/beef.git beef &&\
    cd beef &&\
    git reset --hard $COMMIT &&\
    yes | ./install &&\
    apk del $BUILD_DEPS &&\
    rm -rf /beef/.git &&\
    rm -rf /var/cache/apk/*

WORKDIR /beef

ADD /config.yaml.patch /beef/config.yaml.patch

RUN patch /beef/config.yaml /beef/config.yaml.patch

ENTRYPOINT ["./beef", "-x"]
