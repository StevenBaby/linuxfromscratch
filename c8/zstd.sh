#!/bin/bash
BASE="$(dirname $(dirname $(realpath "$0")))"

source $BASE/tools/config.1.sh
source $BASE/tools/extract.sh

make prefix=/usr

make prefix=/usr install

rm -v /usr/lib/libzstd.a
