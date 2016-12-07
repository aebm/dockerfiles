FROM python:3.5.2-alpine

RUN /usr/local/bin/pip install -U youtube_dl

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
