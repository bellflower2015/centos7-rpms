CURDIR=$(cd $(dirname "$0") && pwd)
. "$CURDIR/../config.sh"

NAME=bellflower-release
VERSION=7
BASENAME=${NAME}-${VERSION}

cp ${NAME}.spec $SPECSDIR/

tmpdir=$(mktemp -d)

cd $tmpdir
mkdir $BASENAME
cp $CURDIR/bellflower.repo $BASENAME/
tar czf ${BASENAME}.tar.gz $BASENAME
mv ${BASENAME}.tar.gz $SOURCESDIR/
cd $CURDIR
rm -rf $tmpdir

do_build
