#!/bin/bash
BASE="$(dirname $(dirname $(realpath "$0")))"

source $BASE/tools/config.1.sh
source $BASE/tools/extract.sh

CC=gcc ./configure --prefix=/usr -G -O3 -r

make
make install
