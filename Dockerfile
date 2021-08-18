FROM    centos:7
RUN yum update -y && yum install httpd httpd-tools -y

RUN systemctl enable httpd.service
RUN systemctl start httpd.service

EXPOSE  80

CMD     ["/usr/sbin/httpd","-D","FOREGROUND"]