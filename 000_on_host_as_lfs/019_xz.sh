#!/bin/bash

set -eu

export TAR_NAME="xz-5.2.5"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/$TAR_NAME
make
make DESTDIR=$LFS install

lfs_lib_post_build
