FROM centos:8

USER 0
# install apache web server
RUN yum -y install httpd

RUN systemctl enable httpd
CMD run-httpd
RUN systemctl status httpd
