cd /root

#phpmyadmin installation
tar zxvf phpMyAdmin-4.9.2-all-languages.tar.gz
rm phpMyAdmin-4.9.2-all-languages.tar.gz
cp ./config.inc.php ./phpMyAdmin-4.9.2-all-languages/
mkdir -p phpMyAdmin-4.9.2-all-languages/tmp 
mv phpMyAdmin-4.9.2-all-languages/ /var/www/localhost/phpmyadmin/

#wordpress installation
tar zxvf wordpress-5.3.1.tar.gz
rm -f wordpress-5.3.1.tar.gz
cp -r wordpress/* /var/www/localhost/
cd /etc/nginx
rm -f ./sites-enabled/default
cd ./sites-enabled
ln -s ../sites-available/server_config .
cd /

#autorisation des nginx user
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

#lancement des services
service nginx start
service php7.3-fpm start
service mysql start

#configuration de mysql
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';" | mysql -u root
echo "GRANT ALL ON wordpress.* TO admin@localhost;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "update mysql.user set plugin = 'mysql_native_password' where user='admin';" | mysql -u root
service mysql restart
tail -f /dev/null
