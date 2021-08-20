FROM registry.redhat.io/rhel8/httpd-24

USER 0
RUN yum install php-fpm php-mysql \
    && chmod -R 777 /var/www/html
COPY *.php /var/www/html

CMD run-httpd