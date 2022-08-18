#!/bin/bash

set -eu

export TAR_NAME="expat-2.4.6"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/$TAR_NAME
make
#make check
make install
install -v -m644 doc/*.{html,css} /usr/share/doc/$TAR_NAME

lfs_lib_post_build
