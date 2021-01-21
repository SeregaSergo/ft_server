FROM debian:buster-slim 
LABEL maintainer="bswag@student.21-school.ru"

RUN apt -qq update && apt upgrade -yqq && \
	apt -y install \
	nginx vim htop wget mariadb-server php-fpm php-mysql > /dev/null

COPY ./srcs /app
RUN mv /app/bswag_site.com/ /var/www/bswag_site.com

RUN wget https://ru.wordpress.org/latest-ru_RU.tar.gz
RUN tar -xzvf latest-ru_RU.tar.gz
RUN mv wordpress /var/www/bswag_site.com/wordpress
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages /var/www/bswag_site.com/phpmyadmin
RUN chown -R www-data:www-data /var/www/bswag_site.com
RUN rm phpMyAdmin-5.0.4-all-languages.tar.gz latest-ru_RU.tar.gz
EXPOSE 80 443

CMD ["bash", "/app/start_script.sh"]
