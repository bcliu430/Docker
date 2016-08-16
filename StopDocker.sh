#!/bin/bash

set -euo pipefail

if [ "$#" -gt 3 ];then
    echo "Usage: $0 <prefix> <start> <stop>"
    echo "ex: ./StopDocker.sh docker 0 1"
    echo "or: ./StopDocker.sh all"
    exit
fi

if [ $1 == "all" ] 
then
    docker stop $(docker ps -a -q) ||true

else
    for i in `seq $2 $3`; do
        echo " stoping $i"
        docker stop $1$i ubuntu  ||true
    done

fi

docker ps -a
