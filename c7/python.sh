#!/bin/bash
tarname=Python-3.12.5.tar.xz

BASE="$(dirname $(dirname $(realpath "$0")))"

source $BASE/tools/config.1.sh

src=$LFS/sources/python

cd $LFS/sources
rm -rf $src
mkdir -pv $src
tar xvf $tarname -C $src --strip-components=1

cd $src

./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip

make

make install
