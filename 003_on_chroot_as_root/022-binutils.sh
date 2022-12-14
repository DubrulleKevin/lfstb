#!/bin/bash

set -eu

export TAR_NAME="binutils-2.38"

source ../include/lfs_lib.sh

lfs_lib_pre_build

expect -c "spawn ls"
patch -Np1 -i ../binutils-2.38-lto_fix-1.patch
sed -e '/R_386_TLS_LE /i \   || (TYPE) == R_386_TLS_IE \\' \
    -i ./bfd/elfxx-x86.h
mkdir -v build
cd       build
../configure --prefix=/usr       \
             --enable-gold       \
             --enable-ld=default \
             --enable-plugins    \
             --enable-shared     \
             --disable-werror    \
             --enable-64-bit-bfd \
             --with-system-zlib
make tooldir=/usr
#make -k check
make tooldir=/usr install
rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes}.a

lfs_lib_post_build
