#!/bin/bash
BASE="$(dirname $(dirname $(realpath "$0")))"

source $BASE/tools/config.1.sh
source $BASE/tools/extract.sh

./configure --prefix=/usr --disable-static

make
make install
