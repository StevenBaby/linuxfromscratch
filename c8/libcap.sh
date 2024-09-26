#!/bin/bash
BASE="$(dirname $(dirname $(realpath "$0")))"

source $BASE/tools/config.1.sh
source $BASE/tools/extract.sh

sed -i '/install -m.*STA/d' libcap/Makefile

make prefix=/usr lib=lib
make prefix=/usr lib=lib install
