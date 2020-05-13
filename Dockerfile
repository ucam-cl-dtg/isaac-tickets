FROM php:7.3-apache

RUN apt-get update

RUN apt-get install -y \
        libssl-dev libc-client2007e-dev libkrb5-dev \
        libpng-dev libjpeg-dev
RUN docker-php-ext-install mysqli

RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl
RUN docker-php-ext-install imap
RUN docker-php-ext-install gd
