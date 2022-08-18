#!/bin/bash

set -eu

export TAR_NAME="sed-4.8"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr
make
make html
#make check || true
make install
install -d -m755           /usr/share/doc/$TAR_NAME
install -m644 doc/sed.html /usr/share/doc/$TAR_NAME

lfs_lib_post_build
