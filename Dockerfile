FROM ubuntu:trusty
MAINTAINER Hugo BARROUX
LABEL version="1.0"
LABEL description="For web developpement"

RUN export TERM=xterm


ENV APACHE_DOC_ROOT /var/www/
ENV PHP_TIMEZONE Europe/Rome

RUN apt-get update && apt-get install -y apache2
RUN a2enmod rewrite
RUN apt-get install -y php5
RUN apt-get install -y build-essential wget nano vim
RUN echo "mysql-server-5.5 mysql-server/root_password password root" | debconf-set-selections
RUN echo "mysql-server-5.5 mysql-server/root_password_again password root" | debconf-set-selections
RUN apt-get update && apt-get install -y mysql-server
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

VOLUME ["/var/lib/mysql"]

EXPOSE 80
EXPOSE 3306

CMD ["/usr/bin/mysqld_safe"]
CMD ["apache2ctl", "-DFOREGROUND"]


