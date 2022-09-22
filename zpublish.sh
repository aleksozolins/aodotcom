#!bin/sh
lftp sftp://aleksozolins1:$(pass powweb/ops/password)@ftp.aleksozolins.com:2222 -e 'put ~/Dropbox/docs/aodotcom/htdocs/rpn.html ;bye'

lftp sftp://aleksozolins2:$(pass powweb/ops/password)@ftp.aleksozolins.com:2222 -e 'put ~/Dropbox/docs/aodotcom/htdocs/zapier/index.html ;bye'
