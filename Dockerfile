# COPY . /var/www/html/

FROM php:7.3-apache
#Install git
# RUN yum install -y git && docker-php-ext-install pdo pdo_mysql mysqli
# RUN a2enmod rewrite
#Install Composer
# RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
# RUN php composer-setup.php --install-dir=. --filename=composer
# RUN mv composer /usr/local/bin/
COPY . /var/www/html/
EXPOSE 80
