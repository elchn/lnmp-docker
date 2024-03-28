#!/bin/bash

$(which sed) -i 's/%PHP_VERSION%/'$PHPVERSION'/g' /etc/nginx/sites-available/default

mkdir /var/log/php
chmod 644 /var/www/html/pma/config.inc.php
service nginx start
service mariadb start
service php8.2-fpm start

mysql < /build.sql