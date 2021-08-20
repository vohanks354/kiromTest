FROM centos:8

# install apache web server
RUN yum -y install httpd

RUN systemctl enable httpd
RUN systemctl start httpd
RUN systemctl status httpd
