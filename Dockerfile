FROM centos:centos7
MAINTAINER Mikel Asla mikel.asla@keensoft.es

RUN yum update -y
RUN yum install -y \
    wget \
    tar 

# Java installation
ENV JRE_BUILD 8u45-b14
ENV JRE_VERSION 8u45
ENV JRE_DIR jdk1.8.0_45
ENV JRE_TGZ server-jre-$JRE_VERSION-linux-x64.tar.gz
ENV JRE_URL http://download.oracle.com/otn-pub/java/jdk/$JRE_BUILD/$JRE_TGZ

RUN set -x \
	&& wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" $JRE_URL \
	&& mkdir -p /usr/local/java \
	&& tar xzvf $JRE_TGZ -C /usr/local/java \
	&& rm -f $JRE_TGZ

ENV JAVA_HOME /usr/local/java/$JRE_DIR
ENV JRE_HOME $JAVA_HOME/jre
ENV PATH $JAVA_HOME/bin:$JRE_HOME/bin:$PATH
