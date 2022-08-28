#!/bin/bash

set -eu

export TAR_NAME="gmp-6.2.1"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/$TAR_NAME
make
make html
#make check 2>&1 | tee gmp-check-log
#awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log
make install
make install-html

lfs_lib_post_build
