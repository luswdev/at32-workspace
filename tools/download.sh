#!/bin/bash

if [ "$#" -lt 1 ]; then
    echo "Usage: ./download.sh [target.bin]"
    exit 1
fi

openocd -f openocd.cfg \
        -c "init" \
        -c "reset init" \
        -c "poll" \
        -c "flash probe 0" \
        -c "at32f4xx mass_erase 0" \
        -c "flash write_image erase $1 0x08000000" \
        -c "reset run" \
        -c "shutdown"
