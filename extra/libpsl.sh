#!/bin/bash
BASE="$(dirname $(dirname $(realpath "$0")))"

source $BASE/tools/config.1.sh
source $BASE/tools/extract.sh

mkdir build &&
cd    build &&

meson setup --prefix=/usr --buildtype=release

ninja