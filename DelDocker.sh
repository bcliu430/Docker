#!/bin/bash

set -euo pipefail

if [ "$#" -lt 3 ];then
    echo "Usage: $0 <prefix> <start> <stop>"
    echo "ex: ./installDocker.sh docker 0 1"
    exit
fi

    for i in `seq $2 $3`; do
        echo " stop $i"
        docker stop --name $1$i ubuntu /bin/bash || true
        docker rm --name $1$i ubuntu /bin/bash || true

# docker stop $(docker ps -a -q)
# stop all docker 
# docker rm $(docker ps -a -q)
# remove all
docker ps -a

#TODO
# ADD stop all
# ADD remove all
