#!/bin/bash

set -eu

export TAR_NAME="findutils-4.9.0"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr                   \
            --localstatedir=/var/lib/locate \
            --host=$LFS_TGT                 \
            --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install

lfs_lib_post_build
