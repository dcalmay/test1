
FROM centos:centos7

RUN yum -y update; yum clean all
RUN yum -y install python python-pip;yum clean all
RUN yum -y install python-pip; yum clean all
RUN yum -y install epel-release && yum clean all
RUN yum -y install python-pip && yum clean all

RUN mkdir /opt/app
COPY src/main.py  /opt/app/

COPY requirements.txt /opt/app/
RUN pip install -r /opt/app/requirements.txt

COPY docker-entrypoint.sh /

ENTRYPOINT "/docker-entrypoint.sh"

