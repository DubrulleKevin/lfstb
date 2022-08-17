#!/bin/bash

set -eu

export TAR_NAME="elfutils-0.186"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr                \
            --disable-debuginfod         \
            --enable-libdebuginfod=dummy
make
#make check
make -C libelf install
install -vm644 config/libelf.pc /usr/lib/pkgconfig
rm /usr/lib/libelf.a

lfs_lib_post_build
