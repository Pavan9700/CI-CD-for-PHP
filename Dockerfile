FROM php:7.2-apache
COPY src/*.html /var/www/html/
chown -R www-data:www-data /var/www/html
