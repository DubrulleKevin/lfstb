#!/bin/bash

set -eu

export TAR_NAME="kbd-2.4.0"

source ../include/lfs_lib.sh

lfs_lib_pre_build

patch -Np1 -i ../kbd-2.4.0-backspace-1.patch
sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in
./configure --prefix=/usr --disable-vlock
make
#make check
make install

lfs_lib_post_build
