#!/bin/bash

rm /etc/nginx/sites-enabled/default
service nginx start
service mysql start
service php7.3-fpm start
service php7.3-fpm status

/bin/bash
