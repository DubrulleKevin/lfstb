#!/bin/bash

set -e

export TAR_NAME="bash-5.1.16"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr                      \
            --docdir=/usr/share/doc/$TAR_NAME  \
            --without-bash-malloc              \
            --with-installed-readline
make
#/usr/bin/expect << EOF
#set timeout -1
#spawn make tests
#expect eof
#lassign [wait] _ _ _ value
#exit $value
#EOF
make install
#exec /usr/bin/bash --login

lfs_lib_post_build
