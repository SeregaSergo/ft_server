# ft_server

This repository was made for project ft_server in 21-school.

The main purpose is to make a docker container (Dockerfile) with LEMP and WordPress.

It contains start.sh for easy running on school's macos computers. You should have docker-machine for using this script.

------------------------
Usage of start.sh
------------------------
Change inside script vm_name and image_name if you want.


. ./start.sh -s         Full start with moving your vm to directory goinfre

. ./start.sh -ms        Start your existing machine

./start.sh -b           Create an image

./start.sh -c           Create a container (opened 80, 443 ports)
