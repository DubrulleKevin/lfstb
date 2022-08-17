#!/bin/bash

set -eu

export TAR_NAME="Python-3.10.2"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip
make
make install

lfs_lib_post_build
