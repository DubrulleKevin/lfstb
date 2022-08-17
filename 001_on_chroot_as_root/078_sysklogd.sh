#!/bin/bash

set -eu

export TAR_NAME="sysklogd-1.5.1"

source ../include/lfs_lib.sh

lfs_lib_pre_build

sed -i '/Error loading kernel symbols/{n;n;d}' ksym_mod.c
sed -i 's/union wait/int/' syslogd.c
make
make BINDIR=/sbin install

lfs_lib_post_build
