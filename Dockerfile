FROM centos:8

LABEL maintainer="kirom@metrocom.co.id"
RUN dnf update -y
RUN dnf upgrade -y
RUN dnf install epel-release -y
RUN dnf install nginx -y

USER 0
COPY test.php /var/www/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]