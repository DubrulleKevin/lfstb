#!/bin/bash

set -eu

export TAR_NAME="gawk-5.1.1"

source ../include/lfs_lib.sh

lfs_lib_pre_build

sed -i 's/extras//' Makefile.in
./configure --prefix=/usr
make
#make check
make install
mkdir -pv                                   /usr/share/doc/$TAR_NAME
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/$TAR_NAME

lfs_lib_post_build
