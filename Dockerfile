FROM registry.redhat.io/rhel8/httpd-24

USER 0

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm 
RUN yum install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm 
RUN yum module enable php:remi-8.0 -y 
RUN yum install php php-cli php-common 

RUN chmod -R 777 /var/www/html

COPY *.php /var/www/html

CMD run-httpd