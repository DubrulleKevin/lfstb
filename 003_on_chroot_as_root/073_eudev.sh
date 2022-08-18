#!/bin/bash

set -eu

export TAR_NAME="eudev-3.2.11"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr           \
            --bindir=/usr/sbin      \
            --sysconfdir=/etc       \
            --enable-manpages       \
            --disable-static
make
mkdir -pv /usr/lib/udev/rules.d
mkdir -pv /etc/udev/rules.d
#make check
make install
tar -xvf ../udev-lfs-20171102.tar.xz
make -f udev-lfs-20171102/Makefile.lfs install
udevadm hwdb --update

lfs_lib_post_build
