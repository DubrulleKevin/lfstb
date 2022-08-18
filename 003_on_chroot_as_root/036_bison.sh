#!/bin/bash

set -eu

export TAR_NAME="bison-3.8.2"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr --docdir=/usr/share/doc/$TAR_NAME
make
#make check
make install

lfs_lib_post_build
