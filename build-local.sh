#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
VERSION=10.9.0
DISTDIR="$DIR/../pontus-dist/opt/pontus/pontus-node/$VERSION";
TARFILE=$DIR/pontus-node-${VERSION}.tar.gz

CURDIR=`pwd`
cd $DIR

echo DIR is $DIR
echo TARFILE is $TARFILE

if [[ ! -f $TARFILE ]]; then

yum -y install attr bind-utils docbook-style-xsl gcc gdb krb5-workstation        libsemanage-python libxslt perl perl-ExtUtils-MakeMaker        perl-Parse-Yapp perl-Test-Base pkgconfig policycoreutils-python        python-crypto gnutls-devel libattr-devel keyutils-libs-devel        libacl-devel libaio-devel libblkid-devel libxml2-devel openldap-devel        pam-devel popt-devel python-devel readline-devel zlib-devel systemd-devel

./configure --prefix=/opt/pontus/pontus-node/${VERSION}
make -j 4
make install


tar cpzvf ${TARFILE} /opt/pontus/pontus-node

fi

if [[ ! -d $DISTDIR ]]; then
  mkdir -p $DISTDIR
fi

cd $DISTDIR
rm -rf *
cd $DISTDIR/../../../..
tar xvfz $TARFILE
cd $DISTDIR/..
ln -s $VERSION current
cd current

cd $CURDIR


