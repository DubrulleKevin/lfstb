#!/bin/bash

set -eu

export TAR_NAME="grub-2.06"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror
make
make install
mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions

lfs_lib_post_build
