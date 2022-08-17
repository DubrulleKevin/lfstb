#!/bin/bash

set -eu

export TAR_NAME="gawk-5.1.1"

source ../include/lfs_lib.sh

lfs_lib_pre_build

sed -i 's/extras//' Makefile.in
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install

lfs_lib_post_build
