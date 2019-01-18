FROM php:7-apache

RUN echo 'deb http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list
RUN echo 'deb-src http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list

RUN curl https://www.dotdeb.org/dotdeb.gpg | apt-key add -

RUN apt-get update

RUN apt-get install -y \
        libssl-dev libc-client2007e-dev libkrb5-dev \
        libpng12-dev libjpeg-dev \
        php7.0-mysql

RUN docker-php-ext-install mysqli

RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl
RUN docker-php-ext-install imap
RUN docker-php-ext-install gd