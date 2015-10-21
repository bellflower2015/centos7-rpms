srpms=$(find ~/rpmbuild/SRPMS -type f -name *.rpm | xargs)
if [ ! -z "$srpms" ]; then
    dropbox_uploader.sh upload $srpms /centos/7/SRPMS/
fi
