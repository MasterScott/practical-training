FROM python:3.7-alpine

ENV BRANCH="master"
ENV COMMIT="HEAD"

ENV BUILD_DEPS="build-base gcc libc-dev libxslt-dev mariadb-dev git"
ENV RUNTIME_DEPS="libxslt mariadb-connector-c-dev"

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apk update &&\
    apk add --no-cache $BUILD_DEPS $RUNTIME_DEPS &&\
    git clone --branch=$BRANCH https://github.com/lanmaster53/pwnedhub.git pwnedhub &&\
    cd pwnedhub &&\
    git reset --hard $COMMIT &&\
    pip install --no-cache-dir -r REQUIREMENTS.txt &&\
    apk del $BUILD_DEPS &&\
    rm -rf /pwnedhub/.git &&\
    rm -rf /var/cache/apk/*

WORKDIR /pwnedhub
