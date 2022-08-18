#!/bin/bash

set -eu

export TAR_NAME="gcc-11.2.0"

source ../include/lfs_lib.sh

lfs_lib_pre_build

mkdir -v build
cd       build
../libstdc++-v3/configure           \
    --host=$LFS_TGT                 \
    --build=$(../config.guess)      \
    --prefix=/usr                   \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/$(echo $TAR_NAME | sed 's/gcc-//')
make
make DESTDIR=$LFS install

lfs_lib_post_build
