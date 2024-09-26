#!/bin/bash
BASE="$(dirname $(dirname $(realpath "$0")))"

source $BASE/tools/config.1.sh
source $BASE/tools/extract.sh

make BUILD_STATIC=no PREFIX=/usr
make BUILD_STATIC=no PREFIX=/usr install