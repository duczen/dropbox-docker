#!/bin/sh

chown -R dropboxd: /home/dropboxd

HOME=/home/dropboxd sudo -u dropboxd /home/dropboxd/.dropbox-dist/dropboxd
