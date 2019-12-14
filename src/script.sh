#!/bin/sh
cd /var/www/localhost/
tar zxvf wordpress-5.3.1.tar.gz
cd /
rm /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/server_config /etc/nginx/sites-enabled/default
service nginx start
service php7.3-fpm start
tail -f /dev/null
