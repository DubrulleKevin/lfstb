#!/bin/bash

set -eu

export TAR_NAME="gettext-0.21"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/$TAR_NAME
make
#make check
make install
chmod -v 0755 /usr/lib/preloadable_libintl.so

lfs_lib_post_build
