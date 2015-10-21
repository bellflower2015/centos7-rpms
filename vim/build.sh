CURDIR=$(cd $(dirname "$0") && pwd)
. "$CURDIR/../config.sh"

NAME=vim
VERSION=7.4.898
SRC_URL=https://github.com/vim/vim/archive/v${VERSION}.tar.gz
SRPM=http://vault.centos.org/7.1.1503/os/Source/SPackages/vim-7.4.160-1.el7.src.rpm

CPP_VIM=https://raw.githubusercontent.com/vim-jp/vim-cpp/master/syntax/cpp.vim

install_srpm

rm_src vim-7.4.tar.bz2
rm $SOURCESDIR/7.4.[0-9][0-9][0-9]
rm_src vim-6.4-checkhl.patch
rm_src vim-7.0-specedit.patch
rm_src vim-7.0-syncolor.patch
rm_src vim-7.3-xsubpp-path.patch
cp $CURDIR/vim-7.4-syncolor.patch $SOURCESDIR/
cp $CURDIR/vim-7.4-xsubpp-path.patch $SOURCESDIR/
curl -L $CPP_VIM -o $SOURCESDIR/cpp.vim

get_src

patch_spec

do_build
