#!/bin/bash

set -eu

export TAR_NAME="binutils-2.38"

source ../include/lfs_lib.sh

lfs_lib_pre_build

mkdir -v build
cd       build
../configure --prefix=$LFS/tools \
             --with-sysroot=$LFS \
             --target=$LFS_TGT   \
             --disable-nls       \
             --disable-werror
make
make install

lfs_lib_post_build
