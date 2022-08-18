#!/bin/bash

set -eu

export TAR_NAME="meson-0.61.1"

source ../include/lfs_lib.sh

lfs_lib_pre_build

python3 setup.py build
python3 setup.py install --root=dest
cp -rv dest/* /
install -vDm644 data/shell-completions/bash/meson /usr/share/bash-completion/completions/meson
install -vDm644 data/shell-completions/zsh/_meson /usr/share/zsh/site-functions/_meson

lfs_lib_post_build
