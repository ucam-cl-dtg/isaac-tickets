FROM php:5.6.24-apache


RUN apt-get update

RUN apt-get install -y \
        libssl-dev libc-client2007e-dev libkrb5-dev \
        libpng12-dev libjpeg-dev \
        php5-mysql

RUN docker-php-ext-install mysqli

RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl
RUN docker-php-ext-install imap
RUN docker-php-ext-install gd

COPY osticket /var/www/html
COPY php.ini /usr/local/etc/php/php.ini
