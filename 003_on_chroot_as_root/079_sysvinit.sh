#!/bin/bash

set -eu

export TAR_NAME="sysvinit-3.01"

source ../include/lfs_lib.sh

lfs_lib_pre_build

patch -Np1 -i ../sysvinit-3.01-consolidated-1.patch
make
make install

lfs_lib_post_build
