FROM debian:buster
RUN apt-get update
RUN apt-get install -y nginx vim
