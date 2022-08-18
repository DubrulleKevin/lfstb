#!/bin/bash

set -eu

export TAR_NAME="libtool-2.4.6"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr
make
#make check || true
make install
rm -fv /usr/lib/libltdl.a

lfs_lib_post_build
