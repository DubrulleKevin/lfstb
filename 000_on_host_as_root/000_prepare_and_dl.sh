#!/bin/bash

set -eu

mkdir -vp $LFS/sources
chmod -v a+wt $LFS/sources

wget -c https://www.linuxfromscratch.org/lfs/view/stable/wget-list --directory-prefix=$LFS/sources
wget -c https://www.linuxfromscratch.org/lfs/view/stable/md5sums --directory-prefix=$LFS/sources
wget --input-file=$LFS/sources/wget-list --continue --directory-prefix=$LFS/sources
pushd $LFS/sources
  md5sum -c md5sums
popd
