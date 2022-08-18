#!/bin/bash

set -eu

export TAR_NAME="iana-etc-20220207"

source ../include/lfs_lib.sh

lfs_lib_pre_build

cp services protocols /etc

lfs_lib_post_build
