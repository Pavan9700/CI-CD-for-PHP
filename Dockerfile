FROM php:7.2-apache
#COPY src/*.html /var/www/html/
RUN --chown -R www-data:www-data /var/www/html
COPY src/*.html /var/www/html/
