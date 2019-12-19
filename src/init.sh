#installation des utilitaires
apt-get update
apt-get install -y wget libnss3-tools vim
apt-get install -y php php7.3-fpm php7.3-mysql
apt-get install -y nginx
apt-get install -y mariadb-server

#configuration de wordpress
cd /root
wget http://wordpress.org/latest.tar.gz
tar zxvf latest.tar.gz
cp wp-config.php wordpress/
mv wordpress/ /var/www/localhost/

#configuration de phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.gz
tar zxvf phpMyAdmin-4.9.2-all-languages.tar.gz
cp ./config.inc.php phpMyAdmin-4.9.2-all-languages/
mkdir -p phpMyAdmin-4.9.2-all-languages/tmp
mv phpMyAdmin-4.9.2-all-languages /var/www/localhost/phpmyadmin

#configuration de mysql
service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';" | mysql -u root
echo "GRANT ALL ON wordpress.* TO admin@localhost;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "update mysql.user set plugin = 'mysql_native_password' where user='admin';" | mysql -u root
mysql wordpress -u admin --password=admin < /root/wordpress.sql

#configuration de nginx
mv nginx.conf /etc/nginx/sites-available
cd /etc/nginx/sites-enabled
ln -s ../sites-available/nginx.conf ./
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

#configuration ssl
mkdir ~/mkcert && cd ~/mkcert
wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64
mv mkcert-v1.1.2-linux-amd64 mkcert && chmod +x mkcert
./mkcert -install
./mkcert localhost

#lancement des services
service nginx start
service php7.3-fpm start
service mysql restart
tail -f /dev/null
