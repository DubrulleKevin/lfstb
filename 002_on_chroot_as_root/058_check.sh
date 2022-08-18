#!/bin/bash

set -eu

export TAR_NAME="check-0.15.2"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr --disable-static
make
#make check
make docdir=/usr/share/doc/$TAR_NAME install

lfs_lib_post_build
