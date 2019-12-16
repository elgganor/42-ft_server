FROM debian:buster
RUN apt-get update
RUN apt-get install -y nginx php php7.3-fpm vim mariadb-server php7.3-mysql
RUN mkdir -p /var/www/localhost
COPY ./src/wordpress-5.3.1.tar.gz /var/www/localhost/
COPY ./src/server_config /etc/nginx/sites-available/
COPY ./src/script.sh /root
COPY ./src/phpMyAdmin-4.9.2-all-languages.tar.gz /root
