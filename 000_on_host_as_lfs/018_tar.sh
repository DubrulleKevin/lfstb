#!/bin/bash

set -eu

export TAR_NAME="tar-1.34"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install

lfs_lib_post_build
