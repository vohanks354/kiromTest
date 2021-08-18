# COPY . /var/www/html/

# FROM pensiero/apache-php-mysql:php7.4
#Install git
# RUN yum install -y git && docker-php-ext-install pdo pdo_mysql mysqli
# RUN a2enmod rewrite
#Install Composer
# RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
# RUN php composer-setup.php --install-dir=. --filename=composer
# RUN mv composer /usr/local/bin/
# COPY . /var/www/html/
# EXPOSE 8081

# PHP + Apache
FROM php:7.4-apache

# Update OS and install common dev tools
RUN apt-get update
RUN apt-get install -y wget vim git zip unzip zlib1g-dev libzip-dev libpng-dev

# Install PHP extensions needed
RUN docker-php-ext-install -j$(nproc) mysqli pdo_mysql gd zip pcntl exif

# Enable common Apache modules
RUN a2enmod headers expires rewrite

# Install Composer
# COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

# Set working directory to workspace
WORKDIR /var/www
