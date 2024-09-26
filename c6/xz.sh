#!/bin/bash
BASE="$(dirname $(dirname $(realpath "$0")))"

source $BASE/tools/config.0.sh
source $BASE/tools/extract.sh

./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.6.2

make

make DESTDIR=$LFS install

rm -v $LFS/usr/lib/liblzma.la
