#!/bin/bash

set -eu

export TAR_NAME="lfs-bootscripts-20210608"

source ../include/lfs_lib.sh

lfs_lib_pre_build

make install

bash /usr/lib/udev/init-net-rules.sh

lfs_lib_post_build
