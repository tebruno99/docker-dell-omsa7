FROM centos:centos7
MAINTAINER Thomas Bruno <tbruno+omsa7git@tombruno.dev>

RUN yum update -y
RUN yum upgrade -y
RUN yum install -y wget openssl-devel perl dmidecode
RUN wget -q -O - http://linux.dell.com/repo/hardware/latest/bootstrap.cgi | bash
RUN yum install -y srvadmin-idracadm7
RUN yum clean all -y
