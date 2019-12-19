FROM debian:buster
RUN mkdir -p /var/www/localhost
COPY ./src/init.sh /root
COPY ./src/wp-config.php /root
COPY ./src/wordpress.sql /root
COPY ./src/config.inc.php /root
COPY ./src/nginx.conf /root
EXPOSE 80
EXPOSE 443
CMD sh /root/init.sh
