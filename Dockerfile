FROM registry.redhat.io/rhel8/httpd-24

USER 0

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm 
RUN yum install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm 
RUN yum module enable php:remi-8.0 -y 

# (ini untuk install php8 on apache)
# RUN yum install php php-cli php-common 

# (ini untuk install php8 on nginx)
RUN yum install -y php php-cli php-common php-fpm

RUN chmod -R 777 /var/www/html

COPY *.php /var/www/html

CMD run-httpd