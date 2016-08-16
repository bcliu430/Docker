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
    docker rm   $(docker ps -a -q) ||true

else
    for i in `seq $2 $3`; do
        echo " deleting $i"
        docker stop $1$i   ||true
        docker rm   $1$i   ||true
    done

fi

docker ps -a
