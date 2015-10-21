CURDIR=$(cd $(dirname "$0") && pwd)
. "$CURDIR/../config.sh"

NAME=shflags
GITHUB_HEAD=af8d27d01bf074e06bf1326d4d9c5da9851d084e
GITHUB_DATE=20130117
VERSION=1.0.3.${GITHUB_DATE}git$(echo $GITHUB_HEAD | cut -c 1-7)
SRC_URL=https://github.com/kward/shflags/archive/${GITHUB_HEAD}.tar.gz
SRPM=https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/source/SRPMS/s/shflags-1.0.3-8.fc23.src.rpm


install_srpm

rm_src shflags-1.0.3.tgz
get_src

cd $SOURCESDIR
tar xzf $(basename $SRC_URL)
mv shflags-${GITHUB_HEAD}/source/1.0 shflags-${VERSION}
rm -rf shflags-${GITHUB_HEAD}
tar czf shflags-${VERSION}.tar.gz shflags-${VERSION}
rm -rf shflags-${VERSION}
rm -f $(basename $SRC_URL)

patch_spec

do_build
