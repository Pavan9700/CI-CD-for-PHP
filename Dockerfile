#FROM php:7.2-apache
#COPY src/*.html /var/www/html/
FROM tomcat
COPY app.war /usr/local/tomcat/webapps/
