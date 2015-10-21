set -e

RPMBUILDDIR=~/rpmbuild
builddirs=(BUILD BUILDROOT RPMS SOURCES SPECS SRPMS)
for d in ${builddirs[@]}; do
    printf -v "${d}DIR" "%s" "$RPMBUILDDIR/$d"
done

setup() {
    eval mkdir -p $RPMBUILDDIR/{$(echo ${builddirs[*]}|tr ' ' ',')}
}

clean() {
    rm -rf $RPMBUILDDIR
    setup
}

log_rpm() {
    local file=rpm_$(date +%Y%m%d_%H%M%S).log
    find ~/rpmbuild/SRPMS/ -type f -name "*.rpm" -printf '%f\n' >  $file
    find ~/rpmbuild/RPMS/  -type f -name "*.rpm" -printf '%f\n' >> $file
}

install_srpm() {
    local tmpdir=$(mktemp -d)
    local path=$tmpdir/$(basename $SRPM)
    if echo "$SRPM" | grep -s ^http; then
        curl -L $SRPM -o $path
    fi
    rpm -i $path 2>/dev/null && rm -rf $tmpdir
}

rm_src() {
    rm "$SOURCESDIR/$1"
}

get_src() {
    local dst=${1:-$(basename "$SRC_URL")}
    curl -L $SRC_URL -o "$SOURCESDIR/$dst"
}

patch_spec() {
    if [ -r $CURDIR/${NAME}.spec.patch ]; then
        patch $SPECSDIR/${NAME}.spec < $CURDIR/${NAME}.spec.patch
    fi
}

do_build() {
    local define=$1

    rpmbuild -bs --rmsource $SPECSDIR/${NAME}.spec
    sudo yum-builddep -y $SRPMSDIR/${NAME}-*.src.rpm

    if [ ! -z "$define" ]; then
        rpmbuild --rebuild --define="$define" $SRPMSDIR/${NAME}-*.src.rpm
    else
        rpmbuild --rebuild $SRPMSDIR/${NAME}-*.src.rpm
    fi

    cd $CURDIR
    log_rpm
}
