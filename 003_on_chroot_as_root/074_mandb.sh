#!/bin/bash

set -eu

export TAR_NAME="man-db-2.10.1"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr                         \
            --docdir=/usr/share/doc/$TAR_NAME     \
            --sysconfdir=/etc                     \
            --disable-setuid                      \
            --enable-cache-owner=bin              \
            --with-browser=/usr/bin/lynx          \
            --with-vgrind=/usr/bin/vgrind         \
            --with-grap=/usr/bin/grap             \
            --with-systemdtmpfilesdir=            \
            --with-systemdsystemunitdir=
make
#make check
make install

lfs_lib_post_build
