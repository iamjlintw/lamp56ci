FROM centos:7.5.1804
MAINTAINER Jethro Lin <jethro_lin@taogo.com.tw>

# Install cli and v8js php extension
COPY scripts/install-lamp.sh /install-lamp.sh
RUN sh /install-lamp.sh && rm /install-lamp.sh 
#CMD ["/usr/sbin/apachectl -DFOREGROUND"]
EXPOSE 80

