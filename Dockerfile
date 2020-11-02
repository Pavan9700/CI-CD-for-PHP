#FROM php:7.2-apache
#COPY src/*.html /var/www/html/
#RUN --chown -R www-data:www-data /var/www/html
#COPY src/*.html /var/www/html/
# Source Image
from ubuntu:16.04
# Mainter Name
maintainer Unknown
RUN apt-transport-https -y
# Command to update and install Apache packages
RUN apt-get update && apt-get install apache2 -y
#to pass all the interactive pop up auto
ARG DEBIAN_FRONTEND=noninteractive
#Commands to install php7.2 including other modules
RUN apt-get install -y php7.2 php7.2-cli php7.2-common
RUN apt-get install php7.2-curl php7.2-gd php7.2-json php7.2-mbstring php7.2-intl php7.2-mysql php7.2-xml php7.2-zip -y
# Update our TimeZone in php.ini file
RUN echo "date.timezone = Asia/Kolkata" > /etc/php/7.2/apache2/php.ini
#Create website document root directoy and logs folder
RUN mkdir /var/www/html/web1/
RUN mkdir /var/www/html/web1/public/
RUN mkdir /var/www/html/web1/logs/
# Copy index.html and info.php file to Web document folder
copy example.html /var/www/html/web1/public
copy info.php /var/www/html/web1/public
copy info.php /var/www/html
#Copy apache virual hostconfiguration file and enable it
copy example.conf /etc/apache2/sites-available/
RUN a2ensite example.conf
#Check apache server configuration
RUN apachectl -t
# open port 
EXPOSE 80
# Command to run Apache server in background
CMD /usr/sbin/apache2ctl -D FOREGROUND
