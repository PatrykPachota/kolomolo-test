FROM centos:8

RUN dnf install centos-release-stream -y --disablerepo=* --enablerepo='extras'
RUN dnf swap centos-{linux,stream}-repos -y --disablerepo=* --enablerepo=extras,Stream-*
RUN dnf distro-sync -y
RUN dnf upgrade -y
RUN yum -y update
RUN yum -y install httpd
RUN echo "Hello Kolomolo" >> /var/www/html/index.html

EXPOSE 80

ADD run.sh /run.sh
RUN chmod -v +x /run.sh

CMD ["/run.sh"]
