#!/bin/bash
tarname=sysvinit-3.10.tar.xz
BASE="$(dirname $(dirname $(realpath "$0")))"

source $BASE/tools/config.1.sh
source $BASE/tools/extract.sh

patch -Np1 -i ../sysvinit-3.10-consolidated-1.patch

make
make install
