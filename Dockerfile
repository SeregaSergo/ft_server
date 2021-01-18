FROM debian:buster-slim 
LABEL maintainer="bswag@student.21-school.ru"

RUN apt update && apt upgrade -y && \
	apt install -y nginx vim htop openssl mariadb-server php-fpm php-mysql

COPY ./srcs /app
COPY ./srcs/nginx/my_site.conf /etc/nginx/conf.d
WORKDIR /app

EXPOSE 80 443
CMD ["bash", "./start_script.sh"]
