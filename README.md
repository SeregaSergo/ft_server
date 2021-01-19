This repository was made for project ft_server in 21-school.\n
The main purpose is to make a docker container (Dockerfile) with LEMP and WordPress.\n
It contains start.sh for easy running on school's macos computers. You should have docker-machine for using this script.\n

------------------------
Usage of start.sh
------------------------
Change inside script vm_name and image_name if you want.\n\n

. ./start.sh -s		Full start with moving your vm to derictory goinfre\n
. ./start.sh -ms	Start your existing machine\n
./start.sh -b		Create an image\n
./start.sh -c		Create a container (opened 80, 443 ports)\n
