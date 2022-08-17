#!/bin/bash

set -eu

export TAR_NAME="gzip-1.11"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr --host=$LFS_TGT
make
make DESTDIR=$LFS install

lfs_lib_post_build
