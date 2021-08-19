FROM centos/httpd-24-centos7:2.4

# Update Apache Configuration
# RUN sed -E -i -e '/<Directory "\/var\/www\/html">/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf
# RUN sed -E -i -e 's/DirectoryIndex (.*)$/DirectoryIndex index.php \1/g' /etc/httpd/conf/httpd.conf

# Update php-fpm Configuration
# RUN sed -E -i -e 's/;listen.owner = nobody/listen.owner = apache/g' /etc/php-fpm.d/www.conf
# RUN sed -E -i -e 's/;listen.group = nobody/listen.group = apache/g' /etc/php-fpm.d/www.conf
# RUN sed -E -i -e 's/listen.acl_users = (.*)$/;listen.acl_users = \1/g' /etc/php-fpm.d/www.conf

# RUN systemctl enable httpd.service

# EXPOSE 80

COPY helloworld.php /var/www/html

# CMD ["/usr/sbin/init"]