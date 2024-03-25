# syntax=docker/dockerfile:1
FROM ubuntu:latest

ARG PHP_VERSION=8.2
ARG PHPMYADMIN=5.2.1

RUN export DEBIAN_FRONTEND=noninteractive;\
  apt-get update; apt-get install -yq software-properties-common apt-transport-https \
  cron vim ssmtp monit wget unzip curl less git; \

RUN export DEBIAN_FRONTEND=noninteractive; apt-get install -yq mariadb-server mariadb-client; \
  cd /var/www/html && ( \
      wget -q https://files.phpmyadmin.net/phpMyAdmin/$PHPMYADMIN/phpMyAdmin-$PHPMYADMIN-all-languages.zip; \
      unzip -oq phpMyAdmin-$PHPMYADMIN-all-languages.zip; \
      mv phpMyAdmin-$PHPMYADMIN-all-languages pma; \
      rm -f phpMyAdmin-$PHPMYADMIN-all-languages.zip; \
    );

RUN add-apt-repository -y ppa:ondrej/php;
RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get install -yq php$PHP_VERSION php$PHP_VERSION-cli php$PHP_VERSION-fpm;

