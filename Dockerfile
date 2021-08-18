# COPY . /var/www/html/

FROM pensiero/apache-php-mysql:php7.4
#Install git
# RUN yum install -y git && docker-php-ext-install pdo pdo_mysql mysqli
# RUN a2enmod rewrite
#Install Composer
# RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
# RUN php composer-setup.php --install-dir=. --filename=composer
# RUN mv composer /usr/local/bin/
RUN mkdir /var/www/public
COPY . /var/www/html/
# EXPOSE 80
