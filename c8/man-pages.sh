#!/bin/bash

BASE="$(dirname $(dirname $(realpath "$0")))"

source $BASE/tools/config.1.sh
source $BASE/tools/extract.sh

rm -v man3/crypt*

make prefix=/usr install
