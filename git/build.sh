CURDIR=$(cd $(dirname "$0") && pwd)
. "$CURDIR/../config.sh"

NAME=git
VERSION=2.6.2
SRC_URL=https://github.com/git/git/archive/v${VERSION}.tar.gz
SRPM=https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/source/SRPMS/g/git-2.6.2-1.fc24.src.rpm

install_srpm

patch_spec

do_build '__check_files %{nil}'
