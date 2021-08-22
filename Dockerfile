# ini sudah bisa jalan di docker #
# di dalamnya ada centos7 httpd dan php #
# versi di docker hub adalah vohanks354/mgs-httpd-php:green #


FROM centos:7
# FROM registry.access.redhat.com/rhel7-rhel-minimal:7.9
MAINTAINER The CentOS Project <cloud-ops@centos.org>
LABEL Vendor="CentOS" \
      License=GPLv2 \
      Version=2.4.6-40

USER 0

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd && \
    yum-config-manager --enable remi-php73 && \
    yum -y install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd && \
    yum clean all && \
    php -v 

COPY test.php /var/www/html/index.php

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

# USER 1001

CMD ["/run-httpd.sh"]