#!/bin/bash

set -eu

export TAR_NAME="tar-1.34"

source ../include/lfs_lib.sh

lfs_lib_pre_build

FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr
make
#make check || true
make install
make -C doc install-html docdir=/usr/share/doc/$TAR_NAME

lfs_lib_post_build
