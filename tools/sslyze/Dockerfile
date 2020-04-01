# docker run -it --rm --add-host pwnedhub.com:172.17.0.1 -v ~/.sslyze:/tmp sslyze --regular www.lanmaster53.com:443
# docker-compose run sslyze --regular www.lanmaster53.com:443

FROM python:3.7-slim-buster

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --no-cache-dir sslyze

ENTRYPOINT ["sslyze"]
