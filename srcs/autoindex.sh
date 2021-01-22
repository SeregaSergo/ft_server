#!/bin/bash

if [ -n "$1" ]
	then
		if [ $1 -eq 1 ]
			then
				sed 's/autoindex off/autoindex on/' /etc/nginx/sites-available/bswag_site.com > output
			else
				sed 's/autoindex on/autoindex off/' /etc/nginx/sites-available/bswag_site.com > output
		fi
		mv output /etc/nginx/sites-available/bswag_site.com
		service nginx restart
	else
		echo "No parameters found. Need one."
fi
