#!/bin/sh
SCRIPT_FILENAME=/var/www/html/index.php \
REQUEST_URI=/ \
QUERY_STRING= \
REQUEST_METHOD=GET \
cgi-fcgi -bind -connect /run/php/php8.2-fpm.sock