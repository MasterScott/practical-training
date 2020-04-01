# docker run -it --rm --add-host pwnedhub.com:172.17.0.1 -v ~/.cewl:/tmp cewl -w /tmp/passwords.txt http://pwnedhub.com
# docker-compose run cewl -w /tmp/passwords.txt http://pwnedhub.com

FROM ruby:2.7-alpine

ENV BRANCH="master"
ENV COMMIT="HEAD"

ENV BUILD_DEPS="build-base git"
ENV RUNTIME_DEPS="exiftool"

RUN apk update &&\
    apk add --no-cache $BUILD_DEPS $RUNTIME_DEPS &&\
    git clone --branch=$BRANCH https://github.com/digininja/CeWL.git cewl &&\
    cd cewl &&\
    git reset --hard $COMMIT &&\
    bundle update --bundler &&\
    bundle install &&\
    echo "Exiftool version:" &&\
    exiftool -ver &&\
    apk del $BUILD_DEPS &&\
    rm -rf /cewl/.git &&\
    rm -rf /var/cache/apk/*

WORKDIR /cewl

ENTRYPOINT ["ruby", "-W0", "./cewl.rb"]
