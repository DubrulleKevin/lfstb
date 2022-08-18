#!/bin/bash

set -eu

export TAR_NAME="zstd-1.5.2"

source ../include/lfs_lib.sh

lfs_lib_pre_build

make
#make check
make prefix=/usr install
rm -v /usr/lib/libzstd.a

lfs_lib_post_build
