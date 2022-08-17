#!/bin/bash

set -eu

export TAR_NAME="expect5.45.4"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr           \
            --with-tcl=/usr/lib     \
            --enable-shared         \
            --mandir=/usr/share/man \
            --with-tclinclude=/usr/include
make
#make test
make install
ln -svf expect5.45.4/libexpect5.45.4.so /usr/lib

lfs_lib_post_build
