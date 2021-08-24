# ini sudah bisa jalan di docker dan openshift #
# di dalamnya ada centos7 httpd dan php #
# versi di docker hub adalah vohanks354/mgs-httpd-php:red #


# FROM centos:7
# FROM registry.access.redhat.com/rhel7-rhel-minimal:7.9
FROM quay.io/vohanks3540/centos:7
MAINTAINER The CentOS Project <cloud-ops@centos.org>
LABEL Vendor="CentOS" \
      License=GPLv2 \
      Version=2.4.6-40

# USER 0

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd && \
    yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum -y install yum-utils && \
    yum-config-manager --enable remi-php74 && \
    yum -y install php php-cli && \
    yum -y install php  php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json && \
    # yum -y install php72 php-common php-opcache php-mcrypt php-cli php-gd php-curl php72-mysqlnd && \
    yum clean all && \
    php -v 

# Update Apache Configuration
# RUN sed -E -i -e '/<Directory "\/var\/www\/html">/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf
# RUN sed -E -i -e 's/DirectoryIndex (.*)$/DirectoryIndex index.php \1/g' /etc/httpd/conf/httpd.conf
RUN sed -i 's/Listen 80$/Listen 8080/' /etc/httpd/conf/httpd.conf

EXPOSE 8080

# Simple startup script to avoid some issues observed with container restart
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

COPY *.php /var/www/html/

RUN chmod 777 /run/httpd/ && \
    chmod 777 /etc/httpd/logs/ && \
    chmod 777 /var/www/html/ && \
    rm -rf /run/httpd/* /tmp/httpd*

CMD ["/run-httpd.sh"]