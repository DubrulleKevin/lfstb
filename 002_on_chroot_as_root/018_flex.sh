#!/bin/bash

set -eu

export TAR_NAME="flex-2.6.4"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr \
            --docdir=/usr/share/doc/$TAR_NAME \
            --disable-static
make
#make check
make install
ln -sv flex /usr/bin/lex

lfs_lib_post_build
