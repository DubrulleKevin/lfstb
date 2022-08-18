#!/bin/bash

set -eu

export TAR_NAME="psmisc-23.4"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr
make
make install

lfs_lib_post_build
