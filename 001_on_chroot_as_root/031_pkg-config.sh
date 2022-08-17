#!/bin/bash

set -eu

export TAR_NAME="pkg-config-0.29.2"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr              \
            --with-internal-glib       \
            --disable-host-tool        \
            --docdir=/usr/share/doc/$TAR_NAME
make
#make check
make install

lfs_lib_post_build
