#!/bin/bash
BASE="$(dirname $(dirname $(realpath "$0")))"

source $BASE/tools/config.1.sh
source $BASE/tools/extract.sh

sed -i "s/echo/#echo/" src/egrep.sh

./configure --prefix=/usr

make
make install
