#FROM php:7.2-apache
#COPY src/*.html /var/www/html/
FROM php:7.3.2-apache-stretch

LABEL maintainer="Unknown. <onigbenga@yahoo.ca>" \
      version="1.2"

COPY . /srv/app

COPY .docker/vhost.conf /etc/apache2/sites-available/000-default.conf
COPY .docker/php.ini /usr/local/etc/php/

WORKDIR /srv/app

RUN docker-php-ext-install mbstring pdo pdo_mysql \
    && chown -R www-data:www-data /srv/app \
    && a2enmod rewrite negotiation \
    && docker-php-ext-install opcache
