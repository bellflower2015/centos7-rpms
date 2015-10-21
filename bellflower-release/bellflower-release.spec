Name:		bellflower-release
Version:	7
Release:	1%{?dist}
Summary:	Bellflower's RPM repository

Group:		System Environment/Base
License:	MIT
URL:		http://bellflower.web4u.jp/
Source0:	%{name}-%{version}.tar.gz

BuildArch:	noarch

%define INSTALLDIR %{buildroot}/etc/yum.repos.d

%description
%{summary}

%prep
%setup -q -n %{name}-%{version}

%build

%install
rm -rf %{INSTALLDIR}
mkdir -p %{INSTALLDIR}
cp -Rp * %{INSTALLDIR}

%clean
[ "$RPM_BUILD_ROOT" != "/" ] && rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%config /etc/yum.repos.d/bellflower.repo

%changelog
* Sun Oct 21 2015 Kikyou Akino <bellflower@web4u.jp> - 7-1
- Create Package
