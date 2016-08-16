FROM php:5.6.24-apache

COPY osticket /var/www/html
COPY php.ini /usr/local/etc/php/php.ini

RUN apt-get update

RUN apt-get install -y \
        php5-mysql

RUN docker-php-ext-install mysqli
