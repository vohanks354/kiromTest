FROM registry.redhat.io/rhel8/httpd-24

RUN install php-fpm php-mysql \
    && chmod -R 777 /var/www/html
COPY *.php /var/www/html

CMD run-httpd