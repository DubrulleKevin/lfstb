#!/bin/bash

set -eu

export TAR_NAME="findutils-4.9.0"

source ../include/lfs_lib.sh

lfs_lib_pre_build

case $(uname -m) in
    i?86)   TIME_T_32_BIT_OK=yes ./configure --prefix=/usr --localstatedir=/var/lib/locate ;;
    x86_64) ./configure --prefix=/usr --localstatedir=/var/lib/locate ;;
esac
make
#make check
make install

lfs_lib_post_build
