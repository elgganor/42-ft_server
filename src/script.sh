cd /var/www/localhost
tar zxvf wordpress-5.3.1.tar.gz
rm -f wordpress-5.3.1.tar.gz
cd /etc/nginx
rm -f ./sites-enabled/default
cd ./sites-enabled
ln -s ../sites-available/server_config .
service nginx start
service php7.3-fpm start
service mysql start
