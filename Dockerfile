FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN sed -i 's/ports.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    apt-get update

RUN apt-get install -y vim

RUN apt-get install -y mysql-server

RUN apt-get install -y nginx

RUN apt-get install -y php

RUN apt-get install -y php-mysqli

RUN apt-get install -y php-fpm

ADD ./mysql.sh /var/www/mysql.sh

RUN chmod 755 /var/www/mysql.sh 

CMD /etc/init.d/php7.4-fpm start && service mysql start && ./var/www/mysql.sh && nginx -g 'daemon off;'

# CMD sleep 3600