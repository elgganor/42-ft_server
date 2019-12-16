cd /var/www/localhost
tar zxvf wordpress-5.3.1.tar.gz
rm -f wordpress-5.3.1.tar.gz
cd /etc/nginx
rm -f ./sites-enabled/default
cd ./sites-enabled
ln -s ../sites-available/server_config .
cd /root
tar zxvf phpMyAdmin-4.9.2-all-languages.tar.gz
rm phpMyAdmin-4.9.2-all-languages.tar.gz
mv phpMyAdmin-4.9.2-all-languages /var/www/localhost/phpmyadmin
cd /
cp /root/config.inc.php /var/www/localhost/phpmyadmin
service nginx start
service php7.3-fpm start
service mysql start

#configuration de mysql
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "GRANT ALL ON wordpress.* TO 'root'@'localhost' IDENTIFIED BY 'root' WITH GRANT OPTION;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root --password=root
mysql wordpress -u root --password=root < /root/wordpress.sql
service mysql restart
