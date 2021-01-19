#!/usr/bin/env /bin/bash

vm_name="default"
img_name="bswag_server"

case "$1" in
	-s) bash ./start.sh -rm
		bash ./start.sh -mc
		docker-machine stop $vm_name
		bash ./start.sh -fs
		. ./start.sh -ms
		. ./start.sh -b
		. ./start.sh -c ;;
	-fs)bash ./scripts/clearcache.sh
		mv ~/.docker/machine ~/goinfre 
		ln -s ~/goinfre/machine ~/.docker/machine ;;
	-rm)docker-machine rm $vm_name
		rm -rf ~/.docker/machine ~/goinfre/machine ;;
	-mc)docker-machine create $vm_name
		eval $(docker-machine env $vm_name) ;;
	-ms)docker-machine start $vm_name
		eval $(docker-machine env $vm_name)
		env | grep DOCKER ;;
	-b) docker build --tag $img_name . ;;
	-c) ip=$(docker-machine ip $vm_name)
		docker run -it -e IP_VM=$ip -p 80:80 -p 443:443 --rm $img_name ;;
esac
