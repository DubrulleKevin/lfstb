#!/bin/bash

set -eu

export TAR_NAME="zlib-1.2.11"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr
make
#make check
make install
rm -fv /usr/lib/libz.a

lfs_lib_post_build
