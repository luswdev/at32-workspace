#!/bin/bash

EXT_CMD=""
CLEAN_FLAG=false

for i in "$@"; do
  case $i in
    -v|--verbose)
      EXT_CMD="VERBOSE=1"
      shift
      ;;
    -c|--clean)
      CLEAN_FLAG=true
      shift
      ;;
    -*|--*)
      echo "Unknown option $i"
      exit 1
      ;;
    *)
      ;;
  esac
done

mkdir -p build
cd build

cmake ..

if [ "$CLEAN_FLAG" = true ]; then
    make clean
fi

make -j`nproc` $EXT_CMD
