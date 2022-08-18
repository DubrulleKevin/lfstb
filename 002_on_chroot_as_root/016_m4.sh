#!/bin/bash

set -eu

export TAR_NAME="m4-1.4.19"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr
make
#make check
make install

lfs_lib_post_build
