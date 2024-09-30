#!/bin/bash
BASE="$(dirname $(dirname $(realpath "$0")))"

source $BASE/tools/config.1.sh
source $BASE/tools/extract.sh

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/libunistring-1.2
make
make install
