remotedir=www/bellflower.web4u.jp/downloads/centos-test/7
server=bellflower

rpms=$(find ~/rpmbuild/RPMS -type f -name *.rpm | xargs)
if [ ! -z "$rpms" ]; then
    scp $rpms $server:~/$remotedir/x86_64/
    ssh $server "source ~/.bashrc >/dev/null 2>&1; createrepo ~/$remotedir/x86_64"
fi

srpms=$(find ~/rpmbuild/SRPMS -type f -name *.rpm | xargs)
if [ ! -z "$srpms" ]; then
    scp $srpms $server:~/$remotedir/SRPMS/
    ssh $server "source ~/.bashrc >/dev/null 2>&1; createrepo ~/$remotedir/SRPMS"
fi
