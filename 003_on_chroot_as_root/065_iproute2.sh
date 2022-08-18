#!/bin/bash

set -eu

export TAR_NAME="iproute2-5.16.0"

source ../include/lfs_lib.sh

lfs_lib_pre_build

sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8
make
make SBINDIR=/usr/sbin install
mkdir -pv             /usr/share/doc/$TAR_NAME
cp -v COPYING README* /usr/share/doc/$TAR_NAME

lfs_lib_post_build
