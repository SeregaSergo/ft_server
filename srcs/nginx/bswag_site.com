server {
    listen				443 ssl default_server;
	listen				[::]:443;
    server_name			bswag_site.com;
    ssl_certificate		/app/nginx/ssl/cert.crt;
    ssl_certificate_key	/app/nginx/ssl/cert.key;
    ssl_protocols		TLSv1 TLSv1.1 TLSv1.2;
	root				/var/www/bswag_site.com;
	index				index.php index.html index.htm;
		
	location / {
		try_files $uri $uri/=404;
	}

	location ~ /.php$ {
		include snippets/fastcgi-php.conf;
		fastcgi_pass unix:/var/run/php7.3-fpm.sock;
	}
}

server {
        listen 80;
		listen [::]:80;
        server_name bswag_site.com;
		return 301 https://$host$request_uri;
}
