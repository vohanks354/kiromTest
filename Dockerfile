FROM centos:8

USER 0
# install apache web server
RUN yum -y install httpd

RUN systemctl enable httpd
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
# RUN systemctl status httpd
