FROM ubuntu:14.04
MAINTAINER Hugo BARROUX <hubarroux@erondror.fr>

# Mise en place de l’environment
ENV DEBIAN_FRONTEND noninteractive


# Mise à jour des sources
RUN apt-get update -y

# installation de http
RUN apt-get install -y apache2 vim bash-completion unzip
RUN mkdir -p /var/lock/apache2 /var/run/apache2

# installation de php
RUN apt-get install -y php5 php5-mysql php5-dev php5-gd php5-memcache php5-pspell php5-snmp snmp php5-xmlrpc libapache2-mod-php5 php5-cli

# installation de composer

RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# Autres

EXPOSE 80 443


CMD ["apache2ctl", "-DFOREGROUND"]
