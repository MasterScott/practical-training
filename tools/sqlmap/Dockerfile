# docker run -it --rm --add-host pwnedhub.com:172.17.0.1 -v ~/.sqlmap:/root/.sqlmap sqlmap -u "http://pwnedhub.com/reset" --data "username=cdscssd" -p "username" --dbms MySQL --level 2 --flush-session --batch
# docker-compose run sqlmap -u "http://pwnedhub.com/reset" --data "username=cdscssd" -p "username" --dbms MySQL --level 2 --flush-session --batch

FROM python:3.7-slim-buster

ENV BRANCH="master"
ENV COMMIT="HEAD"

ENV BUILD_DEPS="git"
ENV RUNTIME_DEPS=""

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get -y update &&\
    apt-get -y install --no-install-recommends $BUILD_DEPS $RUNTIME_DEPS &&\
    git clone --branch=$BRANCH https://github.com/sqlmapproject/sqlmap.git sqlmap &&\
    cd sqlmap &&\
    git reset --hard $COMMIT &&\
    apt-get -y purge --auto-remove $BUILD_DEPS &&\
    apt-get -y clean &&\
    rm -rf /sqlmap/.git &&\
    rm -rf /var/lib/apt/lists/*

WORKDIR /sqlmap

ENTRYPOINT ["./sqlmap.py"]
