#!/bin/bash

set -eu

export TAR_NAME="file-5.41"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr
make
#make check
make install

lfs_lib_post_build
