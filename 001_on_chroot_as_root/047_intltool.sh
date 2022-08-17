#!/bin/bash

set -eu

export TAR_NAME="intltool-0.51.0"

source ../include/lfs_lib.sh

lfs_lib_pre_build

sed -i 's:\\\${:\\\$\\{:' intltool-update.in
./configure --prefix=/usr
make
#make check
make install
install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/${TAR_NAME}/I18N-HOWTO

lfs_lib_post_build
