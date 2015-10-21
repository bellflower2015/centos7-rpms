CURDIR=$(cd $(dirname "$0") && pwd)
. "$CURDIR/../config.sh"

NAME=tig
VERSION=2.1.1
SRC_URL=http://jonas.nitro.dk/tig/releases/${NAME}-${VERSION}.tar.gz

get_src

cd $SOURCESDIR
gunzip -c $(basename $SRC_URL) | tar xf - ${NAME}-${VERSION}/${NAME}.spec
mv ${NAME}-${VERSION}/${NAME}.spec $SPECSDIR/
rmdir ${NAME}-${VERSION}

patch_spec

do_build
