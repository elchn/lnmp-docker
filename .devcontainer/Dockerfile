# syntax=docker/dockerfile:1
FROM ubuntu:latest

ARG PHP_VERSION=8.2
ARG PHPMYADMIN=5.2.1

RUN export DEBIAN_FRONTEND=noninteractive;\
  apt update;\ 
  apt install -yq software-properties-common apt-transport-https\
  vim wget unzip curl less git;

RUN apt install -yq nginx;

# RUN cd /var/www/html && pwd
RUN export DEBIAN_FRONTEND=noninteractive; apt install -yq mariadb-server mariadb-client; \
  cd /var/www/html && ( \
      wget -q https://files.phpmyadmin.net/phpMyAdmin/$PHPMYADMIN/phpMyAdmin-$PHPMYADMIN-all-languages.zip; \
      unzip -oq phpMyAdmin-$PHPMYADMIN-all-languages.zip; \
      mv phpMyAdmin-$PHPMYADMIN-all-languages pma; \
      rm -f phpMyAdmin-$PHPMYADMIN-all-languages.zip; \
    );

RUN add-apt-repository -y ppa:ondrej/php;

RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get install -yq php$PHP_VERSION php$PHP_VERSION-cli php$PHP_VERSION-fpm php$PHP_VERSION-mysql;

COPY ./nginx/default /etc/nginx/sites-available/default
COPY ./phpMyadmin/config.inc.php /var/www/html/pma/config.inc.php
COPY ./php/www.conf /etc/php/$PHP_VERSION/fpm/pool.d/www.conf
COPY ./php/php-fpm.conf /etc/php/$PHP_VERSION/fpm/php-fpm.conf
COPY ./php/php.ini /etc/php/$PHP_VERSION/fpm/php.ini
COPY ./php/index.php /var/www/html/
COPY ./entrypoint.sh ./mysql/build.sql /

RUN chmod +x /entrypoint.sh;

ENTRYPOINT ["/entrypoint.sh"]