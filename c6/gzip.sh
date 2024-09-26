#!/bin/bash
BASE="$(dirname $(dirname $(realpath "$0")))"

source $BASE/tools/config.0.sh
source $BASE/tools/extract.sh

./configure --prefix=/usr --host=$LFS_TGT

make

make DESTDIR=$LFS install
