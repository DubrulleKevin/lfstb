#!/bin/bash

set -eu

export TAR_NAME="less-590"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr --sysconfdir=/etc
make
make install

lfs_lib_post_build
