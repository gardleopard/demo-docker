FROM debian:jessie
MAINTAINER Gard Rimestad <docker@gurters.com>
RUN apt-get update
RUN apt-get install apache2 supervisor net-tools -y
COPY files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY files/apache2.conf /etc/supervisor/conf.d/apache2.conf
COPY files/index.html /var/www/html/index.html

EXPOSE 80
CMD ["/usr/bin/supervisord"]

