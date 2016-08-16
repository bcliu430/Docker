#!/bin/bash

set -euo pipefail

if [ "$#" -lt 3 ];then
    echo "Usage: $0 <prefix> <start> <stop>"
    echo "ex: ./installDocker.sh docker 0 1"
    exit
fi

    for i in `seq $2 $3`; do
        echo " stop $i"
        docker stop $1$i ubuntu  ||true
done

docker ps -a
