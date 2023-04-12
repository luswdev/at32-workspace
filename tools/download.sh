#!/bin/bash

if [ "$#" -lt 1 ]; then
    echo "Usage: ./download.sh [target.bin]"
    exit 1
fi

echo "start openocd in background..."
openocd -f openocd.cfg &

echo "start download client..."
./download.pl $1
