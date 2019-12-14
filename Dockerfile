FROM debian:buster
RUN apt-get update
RUN apt-get install -y nginx vim php php7.3-fpm
RUN mkdir -p /var/www/localhost/
COPY ./src/wordpress-5.3.1.tar.gz /var/www/localhost/
COPY ./src/server_config /etc/nginx/sites-available/
COPY ./src/script.sh /root
CMD sh /root/script.sh
