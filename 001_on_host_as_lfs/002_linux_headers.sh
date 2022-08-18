#!/bin/bash

set -eu

export TAR_NAME="linux-5.16.9"

source ../include/lfs_lib.sh

lfs_lib_pre_build

make mrproper
make headers
find usr/include -name '.*' -delete
rm usr/include/Makefile
cp -rv usr/include $LFS/usr

lfs_lib_post_build
