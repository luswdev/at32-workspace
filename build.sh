#!/bin/bash

mkdir -p build
cd build

cmake ..

make clean
make -j`nproc` $1
