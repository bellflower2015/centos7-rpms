CURDIR=$(cd $(dirname "$0") && pwd)
. "$CURDIR/../config.sh"

NAME=gitflow
SRPM=https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/source/SRPMS/g/gitflow-0.4.2.20120723git53e9c76-6.fc23.src.rpm

install_srpm

do_build
