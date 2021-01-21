server {
    listen				443 ssl default_server;
	listen				[::]:443 ssl default_server;
    server_name			localhost;
    ssl_certificate		/app/nginx/ssl/cert.crt;
    ssl_certificate_key	/app/nginx/ssl/cert.key;
    ssl_protocols		TLSv1 TLSv1.1 TLSv1.2;
	root				/var/www/bswag_site.com;
	index				index.php index.html index.htm;
		
	location / {
		autoindex on;
	}

	location ~ \.php$ {
		include snippets/fastcgi-php.conf;
		fastcgi_pass unix:/run/php/php7.3-fpm.sock;
	}

	location ~* \.(jpg|jpeg|gif|txt|pdf|css|html|docx|doc)$ {
		root		/var/www/bswag_site.com;
	}
}

server {
        listen 80 default_server;
		listen [::]:80 default_server;
        server_name localhost;
		return 301 https://$host$request_uri;
}
