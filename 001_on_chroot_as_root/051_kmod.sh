#!/bin/bash

set -eu

export TAR_NAME="kmod-29"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --with-openssl         \
            --with-xz              \
            --with-zstd            \
            --with-zlib
make
make install

for target in depmod insmod modinfo modprobe rmmod; do
  ln -sfv ../bin/kmod /usr/sbin/$target
done

ln -sfv kmod /usr/bin/lsmod

lfs_lib_post_build
