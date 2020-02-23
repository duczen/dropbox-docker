FROM ubuntu:latest

ENV DROPBOX_VERSION 91.4.548

RUN adduser --system --disabled-login dropboxd \
    && apt-get update \
    && apt-get install -y wget python3 \
    && cd /home/dropboxd \
    && wget -O - https://clientupdates.dropboxstatic.com/dbx-releng/client/dropbox-lnx.x86_64-$DROPBOX_VERSION.tar.gz | tar -xzf -

USER dropboxd

CMD  ["/home/dropboxd/.dropbox-dist/dropboxd"]
