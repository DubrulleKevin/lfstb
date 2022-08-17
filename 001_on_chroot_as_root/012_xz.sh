#!/bin/bash

set -eu

export TAR_NAME="xz-5.2.5"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr   \
            --disable-static                  \
            --docdir=/usr/share/doc/$TAR_NAME
make
#make check
make install

lfs_lib_post_build
