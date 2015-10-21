CURDIR=$(cd $(dirname "$0") && pwd)
. "$CURDIR/../config.sh"

NAME=tmux
SRPM=https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/source/SRPMS/t/tmux-2.0-2.fc23.src.rpm

install_srpm

patch_spec

do_build
