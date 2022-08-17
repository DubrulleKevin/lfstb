#!/bin/bash

set -eu

export TAR_NAME="XML-Parser-2.46"

source ../include/lfs_lib.sh

lfs_lib_pre_build

perl Makefile.PL
make
#make test
make install

lfs_lib_post_build
