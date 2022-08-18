#!/bin/bash

set -eu

export TAR_NAME="libffi-3.4.2"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr          \
            --disable-static       \
            --with-gcc-arch=native \
            --disable-exec-static-tramp
make
#make check
make install

lfs_lib_post_build
