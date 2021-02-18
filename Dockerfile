FROM debian:10.8-slim

ENV DROPBOX_VERSION 116.4.368

RUN adduser --system --disabled-login dropboxd \
    && apt-get update \
    && apt-get install --no-install-recommends -y wget sudo ca-certificates \
        libglib2.0 libglapi-mesa libxext6 libxdamage1 libxcb-glx0 libxcb-dri2-0 \
        libxcb-dri3-0 libxcb-present0 libxcb-sync1 libxshmfence1 libxxf86vm1 \
    && cd /tmp \
    && mkdir /opt/dropbox \
    && wget -O - https://clientupdates.dropboxstatic.com/dbx-releng/client/dropbox-lnx.x86_64-$DROPBOX_VERSION.tar.gz | tar -xzf - \
    && mv .dropbox-dist/dropbox-lnx.x86_64-$DROPBOX_VERSION/* /opt/dropbox \
    && install -dm0 /home/dropboxd/.dropbox-dist \
    && chown -R dropboxd /home/dropboxd \
    && apt purge -y wget \
    && sudo apt autoremove -y

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
