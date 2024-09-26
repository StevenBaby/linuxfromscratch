#!/bin/bash

BASE="$(dirname $(dirname "$0"))"

source $BASE/tools/config.0.sh
source $BASE/tools/extract.sh

make mrproper

make headers
find usr/include -type f ! -name '*.h' -delete
cp -rv usr/include $LFS/usr
