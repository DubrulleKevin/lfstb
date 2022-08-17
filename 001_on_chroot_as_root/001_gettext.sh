#!/bin/bash

set -eu

export TAR_NAME="gettext-0.21"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --disable-shared
make
cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin

lfs_lib_post_build
