FROM centos:7
MAINTAINER David Pesticcio david.pesticcio@gmail.com

ENV container docker

RUN yum -y update \
    && yum clean all
RUN yum -y install systemd \
    && yum clean all \
    && (cd /lib/systemd/system/sysinit.target.wants/ \
    && for i in *i; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done) \
    && rm -f /etc/systemd/system/*.wants/*

# NOTES:
#
# To run a systemd service in this container image,
# install the service,
# then enable the service
# as additional Dockerfile build steps.
#
# eg.
# RUN yum install httpd
# RUN systemctl enable httpd.service

VOLUME [ "/sys/fs/cgroup" ]

ENTRYPOINT ["/usr/sbin/init"]

