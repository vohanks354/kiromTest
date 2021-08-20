FROM registry.redhat.io/rhel8/httpd-24

USER 0
RUN yum -y install epel-release \
    && yum-config-manager --enable remi-php72 \
    && yum update \
    && yum install php \
    && chmod -R 777 /var/www/html
    
COPY *.php /var/www/html

CMD run-httpd