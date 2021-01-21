#!/bin/bash

mv /app/nginx/bswag_site.com /etc/nginx/sites-available
ln -s /etc/nginx/sites-available/bswag_site.com /etc/nginx/sites-enabled/bswag_site.com
mv /app/wp-config.php /var/www/bswag_site.com/wordpress/
rm /etc/nginx/sites-enabled/default
service nginx start
service mysql start

mysql < /app/init_DB.sql

service php7.3-fpm start
service php7.3-fpm status

/bin/bash
