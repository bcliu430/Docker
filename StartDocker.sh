#!/bin/bash

set -euo pipefail

if [ "$#" -gt 3 ];then
    echo "Usage: $0 <prefix> <start> <stop>"
    echo "ex: ./StartDocker.sh docker 0 1"
    echo "or: ./StartDocker.sh all"
    exit
fi

if [ $1 == "all" ] 
then
    docker start $(docker ps -a -q) ||true

else
    for i in `seq $2 $3`; do
        echo " starting $i"
        docker start $1$i   ||true
    done

fi

docker ps -a
