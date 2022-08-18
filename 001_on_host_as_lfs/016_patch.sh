#!/bin/bash

set -eu

export TAR_NAME="patch-2.7.6"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install

lfs_lib_post_build
