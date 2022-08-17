#!/bin/bash

set -eu

export TAR_NAME="attr-2.5.1"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr     \
            --disable-static  \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/$TAR_NAME
make
#make check
make install

lfs_lib_post_build
