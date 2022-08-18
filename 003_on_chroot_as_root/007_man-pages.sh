#!/bin/bash

set -eu

export TAR_NAME="man-pages-5.13"

source ../include/lfs_lib.sh

lfs_lib_pre_build

make prefix=/usr install

lfs_lib_post_build
