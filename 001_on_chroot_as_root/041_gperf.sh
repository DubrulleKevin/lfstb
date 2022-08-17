#!/bin/bash

set -eu

export TAR_NAME="gperf-3.1"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr --docdir=/usr/share/doc/$TAR_NAME
make
make -j1 check
make install

lfs_lib_post_build
