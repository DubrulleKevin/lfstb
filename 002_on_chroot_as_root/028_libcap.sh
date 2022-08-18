#!/bin/bash

set -eu

export TAR_NAME="libcap-2.63"

source ../include/lfs_lib.sh

lfs_lib_pre_build

sed -i '/install -m.*STA/d' libcap/Makefile
make prefix=/usr lib=lib
#make test
make prefix=/usr lib=lib install

lfs_lib_post_build
