FROM php:7-fpm
MAINTAINER Mike Chernev <mike@mikechernev.com>

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt mbstring pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

RUN apt-get update && apt-get install -y git zip unzip
RUN docker-php-ext-install zip

RUN curl --silent --show-error https://getcomposer.org/installer | php
ENV COMPOSER_ALLOW_SUPERUSER=1
