FROM centos

MAINTAINER Shitalkumar.d@teleglobals.com

RUN mkdir /opt/tomcat/
RUN yum install curl -y

WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-9/v9.0.41/bin/apache-tomcat-9.0.41.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-9.0.41/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

COPY sample.war /opt/tomcat/webapps
EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]

