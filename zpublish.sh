#!bin/sh
lftp sftp://aleksozolins1:$(pass powweb/ops/password)@ftp.aleksozolins.com:2222 -e 'put ~/Dropbox/docs/aodotcom/htdocs/zpage.html ;bye'
