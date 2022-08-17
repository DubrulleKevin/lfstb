#!/bin/bash

set -eu

export TAR_NAME="file-5.41"

source ../include/lfs_lib.sh

lfs_lib_pre_build

mkdir build
pushd build
  ../configure --disable-bzlib      \
               --disable-libseccomp \
               --disable-xzlib      \
               --disable-zlib
make
popd
./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess)
make FILE_COMPILE=$(pwd)/build/src/file
make DESTDIR=$LFS install

lfs_lib_post_build
