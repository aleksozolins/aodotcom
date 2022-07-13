#!/bin/sh
lftp sftp://aleksozolins1:$(pass powweb/ops/password)@ftp.aleksozolins.com:2222 -e 'mirror --delete -R ~/Dropbox/docs/aodotcom/htdocs / ;bye'
