FROM debian:buster-slim 
LABEL maintainer="bswag@student.21-school.ru"

RUN apt -qq update && apt upgrade -yqq && \
	apt -y install \
	nginx vim htop mariadb-server php-fpm php-mysql > /dev/null

COPY ./srcs /app
COPY ./srcs/bswag_site.com/ /var/www/bswag_site.com
COPY ./srcs/nginx/bswag_site.com /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/bswag_site.com /etc/nginx/sites-enabled/bswag_site.com
WORKDIR /app

EXPOSE 80 443
CMD ["bash", "./start_script.sh"]
