FROM registry.hz.netease.com/nce2/tomcat:or7_6.0.41

ADD compressed /webroot
RUN \
  touch date.txt && \
  date >> date.txt
