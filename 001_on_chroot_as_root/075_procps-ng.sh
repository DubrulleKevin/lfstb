#!/bin/bash

set -eu

export TAR_NAME="procps-3.3.17"

C_TAR=$(ls ${LFS}/sources/procps*)
ln -s $C_TAR $(echo $C_TAR | sed 's/procps-ng/procps/')

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr                            \
            --docdir=/usr/share/doc/$TAR_NAME        \
            --disable-static                         \
            --disable-kill
make
#make check || true
make install

lfs_lib_post_build
