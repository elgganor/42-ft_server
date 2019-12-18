FROM debian:buster
RUN mkdir -p /var/www/localhost
COPY ./src/wordpress-5.3.1.tar.gz /root
COPY ./src/server_config /root
COPY ./src/script.sh /root
COPY ./src/phpMyAdmin-4.9.2-all-languages.tar.gz /root
COPY ./src/config.inc.php /root
COPY ./src/wordpress.sql /root
COPY ./src/wp-config.php /root
EXPOSE 80
EXPOSE 443
