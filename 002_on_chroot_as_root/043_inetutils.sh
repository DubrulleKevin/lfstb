#!/bin/bash

set -eu

export TAR_NAME="inetutils-2.2"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr        \
            --bindir=/usr/bin    \
            --localstatedir=/var \
            --disable-logger     \
            --disable-whois      \
            --disable-rcp        \
            --disable-rexec      \
            --disable-rlogin     \
            --disable-rsh        \
            --disable-servers
make
#make check
make install
mv -v /usr/{,s}bin/ifconfig

lfs_lib_post_build
