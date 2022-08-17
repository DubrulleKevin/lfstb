#!/bin/bash

set -eu

export TAR_NAME="patch-2.7.6"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr
make
#make check
make install

lfs_lib_post_build
