TAR_FILE="$(ls ${LFS}/sources/${TAR_NAME}.tar.*)"

if [ ! -f "${TAR_FILE}" ]; then
    echo "${TAR_FILE}: File not found" >&2
    exit 1
fi

lfs_lib_pre_build () {
    UPPER_NAME="$(echo $TAR_NAME | tr [a-z] [A-Z])"
    echo "#################### $UPPER_NAME START ####################"

    pushd . &> /dev/null
    cd $LFS/sources

    rm -rf $TAR_NAME

    tar xf $TAR_FILE
    cd $TAR_NAME
}

lfs_lib_post_build () {
    UPPER_NAME="$(echo $TAR_NAME | tr [a-z] [A-Z])"

    popd &> /dev/null

    rm -rf ${LFS}/sources/${TAR_NAME}

    echo "#################### $UPPER_NAME DONE ####################"
}
