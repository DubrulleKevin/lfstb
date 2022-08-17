#!/bin/bash

set -eu

export TAR_NAME="acl-2.3.1"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr         \
            --disable-static      \
            --docdir=/usr/share/doc/$TAR_NAME
make
make install

lfs_lib_post_build
