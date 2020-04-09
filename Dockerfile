FROM debian:10

ENV DROPBOX_VERSION 94.4.384

RUN adduser --system --disabled-login dropboxd \
    && apt-get update \
    && apt-get install -y wget sudo \
    && cd /tmp \
    && mkdir /opt/dropbox \
    && wget -O - https://clientupdates.dropboxstatic.com/dbx-releng/client/dropbox-lnx.x86_64-$DROPBOX_VERSION.tar.gz | tar -xzf - \
    && mv .dropbox-dist/dropbox-lnx.x86_64-$DROPBOX_VERSION/* /opt/dropbox \
    && install -dm0 /home/dropboxd/.dropbox-dist \
    && chown -R dropboxd /home/dropboxd \
    && apt purge -y wget

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
