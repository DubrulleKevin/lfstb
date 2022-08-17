#!/bin/bash

set -eu

export TAR_NAME="groff-1.22.4"

source ../include/lfs_lib.sh

lfs_lib_pre_build

PAGE=A4 ./configure --prefix=/usr
make -j1
make install

lfs_lib_post_build
