#!/bin/bash

set -eu

export TAR_NAME="openssl-3.0.1"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic
make
##make test
sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make MANSUFFIX=ssl install
mv -v /usr/share/doc/openssl /usr/share/doc/$TAR_NAME
cp -vfr doc/* /usr/share/doc/$TAR_NAME

lfs_lib_post_build
