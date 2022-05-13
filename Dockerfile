FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install vim -y
RUN yum install /sbin/service -y
RUN yum install httpd -y
RUN yum install php -y
COPY *.html /var/www/html/
CMD /usr/sbin/httpd -DFOREGROUND && /bin/bash
COPY ./index.html /var/www/html/
