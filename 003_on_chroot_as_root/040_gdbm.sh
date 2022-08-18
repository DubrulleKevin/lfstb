#!/bin/bash

set -eu

export TAR_NAME="gdbm-1.23"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr    \
            --disable-static \
            --enable-libgdbm-compat
make
#make check
make install

lfs_lib_post_build
