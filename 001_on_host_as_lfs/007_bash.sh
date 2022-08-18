#!/bin/bash

set -eu

export TAR_NAME="bash-5.1.16"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr                   \
            --build=$(support/config.guess) \
            --host=$LFS_TGT                 \
            --without-bash-malloc
make
make DESTDIR=$LFS install
ln -sv bash $LFS/bin/sh

lfs_lib_post_build
