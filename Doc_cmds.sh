#!/bin/bash

set -euo pipefail

SCRIPT_RUN_SINGLE="/root/docker/Docker/Doc_cmd.sh"

if [ "$#" -lt 4 ]; then
	echo "usage: $0 <prefix> <start> <stop> <cmd>"
	exit
fi

for i in `seq $2 $3`; do
	( $SCRIPT_RUN_SINGLE $1$i ${*:4}) &
done
wait
