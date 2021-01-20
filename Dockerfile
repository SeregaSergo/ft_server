FROM debian:buster-slim 
LABEL maintainer="bswag@student.21-school.ru"

RUN apt -qq update && apt upgrade -yqq && \
	apt -y install \
	nginx vim htop wget mariadb-server php-fpm php-mysql > /dev/null

RUN wget https://ru.wordpress.org/latest-ru_RU.tar.gz
RUN tar -xv latest-ru_RU.tar.gz
RUN mv latest-ru_RU.tar.gz /var/www/bswag_site.com/wordpress
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -xv phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages.tar.gz /var/www/bswag_site.com/phpmyadmin
RUN chown -R www-data:www-data /var/www/bswag_site.com

COPY ./srcs /app
COPY ./srcs/bswag_site.com/ /var/www/bswag_site.com
COPY ./srcs/nginx/bswag_site.com /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/bswag_site.com /etc/nginx/sites-enabled/bswag_site.com
WORKDIR /app

EXPOSE 80 443
CMD ["bash", "./start_script.sh"]
