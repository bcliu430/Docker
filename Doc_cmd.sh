#!/bin/bash

set -euxo pipefail

if [ "$1" == "" ] || [ "$2" == "" ]; then
	echo "usage: $0 <docker_name> <cmd>"
	exit
fi

PID=$(docker inspect --format {{.State.Pid}} $1)

nsenter --target $PID --mount --uts --ipc --net --pid     ${*:2} 2>&1 | sed "s/^/[$1] /"
