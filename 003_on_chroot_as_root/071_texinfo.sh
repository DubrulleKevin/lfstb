#!/bin/bash

set -eu

export TAR_NAME="texinfo-6.8"

source ../include/lfs_lib.sh

lfs_lib_pre_build

./configure --prefix=/usr
sed -e 's/__attribute_nonnull__/__nonnull/' \
    -i gnulib/lib/malloc/dynarray-skeleton.c
make
#make check
make install
make TEXMF=/usr/share/texmf install-tex
pushd /usr/share/info
  rm -v dir
  for f in *
    do install-info $f dir 2>/dev/null
  done
popd

lfs_lib_post_build
