FROM: php:5.6.24-apache

COPY osticket /var/www/html

RUN apt-get update && apt-get install -y \
        libapache2-mod-auth-mysql
        php5-mysql