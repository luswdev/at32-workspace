#!/bin/bash

ARCH=$(dpkg --print-architecture)

RUN_CMD="$*"

case $ARCH in
    darwin-arm64)
        echo "Build docker image for Apple Silicon"
        docker build --platform linux/arm64/v8 --network=host -t at32-workspace . -f docker/toolchain.dockerfile $RUN_CMD
        ;;
    *)
        echo "Build docker image for general platform"
        docker build --network=host -t at32-workspace . -f docker/toolchain.dockerfile $RUN_CMD
        ;;
esac
