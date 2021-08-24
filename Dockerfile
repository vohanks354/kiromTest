# ini sudah bisa jalan di docker dan openshift #
# di dalamnya ada centos7 httpd dan php #
# versi di docker hub adalah vohanks354/mgs-httpd-php:red #


FROM quay.io/vohanks3540/mgs-httpd-php:red

COPY *.php /var/www/html/