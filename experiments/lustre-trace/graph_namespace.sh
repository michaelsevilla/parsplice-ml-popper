#!/bin/bash


if [ "$#" -ne 1 ]; then
  echo "USAGE: $0 <filename>"
  exit 1
fi

docker run --rm -it \
  -v `pwd`:/root/ \
  -w /root \
  graphviz -Tpng $1 -o $1.png
