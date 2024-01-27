# Use PHP with FPM
FROM php:fpm

# Install Nginx, nano, and vi
RUN apt-get update && apt-get install -y \
    nginx \
    nano \
    vim

# Copy your Nginx site configuration
COPY nginx-site.conf /etc/nginx/sites-available/default

# Start PHP-FPM and Nginx
CMD php-fpm && nginx -g 'daemon off;'



## Use PHP with FPM
#FROM php:fpm
#
## Install Nginx
#RUN apt-get update && apt-get install -y nginx
#
## Copy your Nginx site configuration (you should create this file)
#COPY nginx-site.conf /etc/nginx/sites-available/default
#
## Start PHP-FPM and Nginx
#CMD php-fpm && nginx -g 'daemon off;'

