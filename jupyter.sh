#!/bin/bash

set -e -x
#docker run --rm -v `pwd`:/home/jovyan/work -p 81:8888 jupyter/scipy-notebook:xkcd
docker run --rm -v `pwd`:/home/jovyan/work -p 81:8888 jupyter/scipy-notebook:ea9927c3f043
