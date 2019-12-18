#Installation des packages
apt-get update
apt-get install -y nginx
apt-get install -y php php7.3-fpm php7.3-mysql
apt-get install -y wget libnss3-tools vim
apt-get install -y mariadb-server


#Configuration de nginx
cp /root/server_config /etc/nginx/sites-available/
cd /etc/nginx
rm -f ./sites-enabled/default
cd ./sites-enabled
ln -s ../sites-available/server_config .

#configuration de mysql
service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';" | mysql -u root
echo "GRANT ALL ON wordpress.* TO admin@localhost;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "update mysql.user set plugin = 'mysql_native_password' where user='admin';" | mysql -u root
mysql wordpress -u admin --password=admin < /root/wordpress.sql

mkdir -p /var/www/localhost

#wordpress installation
cd /root
tar zxvf wordpress-5.3.1.tar.gz
rm -f wordpress-5.3.1.tar.gz
mv wp-config.php wordpress/
mv wordpress/ /var/www/localhost/
#cp -r wordpress/ /var/www/localhost/

#phpmyadmin installation
tar zxvf phpMyAdmin-4.9.2-all-languages.tar.gz
rm phpMyAdmin-4.9.2-all-languages.tar.gz
cp ./config.inc.php ./phpMyAdmin-4.9.2-all-languages/
mkdir -p phpMyAdmin-4.9.2-all-languages/tmp 
mv phpMyAdmin-4.9.2-all-languages/ /var/www/localhost/phpmyadmin/

#configuration ssl
# cd /root
# wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64
# mv mkcert-v1.1.2-linux-amd64 mkcert
# chmod +x mkcert
# cp mkcert /usr/local/bin/
# mkcert -install
# mkcert localhost
# mkdir cert
# mv ./localhost.pem /root/cert/
# mv ./localhost-key.pem /root/cert/

mkdir ~/mkcert && cd ~/mkcert
wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64
mv mkcert-v1.1.2-linux-amd64 mkcert && chmod +x mkcert
./mkcert -install
./mkcert localhost

#allow nginx user
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

#lancement des services
service nginx start
service php7.3-fpm start
service mysql restart

#tail -f /dev/null
