#!/usr/bin/env /bin/bash

vm_name="default"
img_name="bswag_server"

case "$1" in
	-fs) bash ~/Desktop/projects/clearcache.sh
		mv ~/.docker/machine ~/goinfre 
		ln -s ~/goinfre/machine ~/.docker/machine ;;
	-mc) docker-machine create $vm_name
		eval $(docker-machine env $vm_name) ;;
	-ms) docker-machine start $vm_name
		eval $(docker-machine env $vm_name) ;;
	-b) docker build --tag $img_name . ;;
	-c) ip=$(docker-machine ip $vm_name)
		docker run -it -e IP_VM=$ip -p 80:80 -p 443:443 --rm $img_name ;;
esac
