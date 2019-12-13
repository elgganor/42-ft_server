FROM debian:buster
RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install -y vim
RUN apt install -y php7.3
RUN apt-get install -y php7.3-fpm

RUN mkdir -p /var/www/localhost
COPY src/wordpress-5.3.1.tar.gz /var/www/localhost
