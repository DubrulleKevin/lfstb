#!/bin/bash

set -eu

export TAR_NAME="mpc-1.2.1"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/$TAR_NAME
make
make html
#make check
make install
make install-html

lfs_lib_post_build
