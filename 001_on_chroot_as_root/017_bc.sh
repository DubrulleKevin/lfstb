#!/bin/bash

set -eu

export TAR_NAME="bc-5.2.2"

source ../include/lfs_lib.sh

lfs_lib_pre_build

CC=gcc ./configure --prefix=/usr -G -O3
make
#make test
make install

lfs_lib_post_build
