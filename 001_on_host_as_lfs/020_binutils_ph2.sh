#!/bin/bash

set -eu

export TAR_NAME="binutils-2.38"

source ../include/lfs_lib.sh

lfs_lib_pre_build

sed '6009s/$add_dir//' -i ltmain.sh
mkdir -v build
cd       build
../configure                   \
    --prefix=/usr              \
    --build=$(../config.guess) \
    --host=$LFS_TGT            \
    --disable-nls              \
    --enable-shared            \
    --disable-werror           \
    --enable-64-bit-bfd
make
make DESTDIR=$LFS install

lfs_lib_post_build
