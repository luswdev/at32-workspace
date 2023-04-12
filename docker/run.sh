#!/bin/bash

RUN_CMD="$*"

if [ -t 1 ];then
    docker run -v $(pwd):/opt/project \
        -it --rm  \
        --hostname at32-workspace \
        --workdir /opt/project \
        stm32-workspace:latest $RUN_CMD
else
    docker run -v $(pwd):/opt/project \
    -i --rm  \
    --hostname at32-workspace \
    --workdir /opt/project \
    stm32-workspace:latest $RUN_CMD
fi

