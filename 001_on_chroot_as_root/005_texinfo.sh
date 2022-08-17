#!/bin/bash

set -eu

export TAR_NAME="texinfo-6.8"

source ../include/lfs_lib.sh

lfs_lib_pre_build

sed -e 's/__attribute_nonnull__/__nonnull/' \
    -i gnulib/lib/malloc/dynarray-skeleton.c
./configure --prefix=/usr
make
make install

lfs_lib_post_build
