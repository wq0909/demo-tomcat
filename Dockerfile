FROM 10.180.155.50:5001/nce2/tomcat:7.0.62

ADD compressed /webroot
RUN \
  touch date_yanlian.txt && \
  date >> date.txt
