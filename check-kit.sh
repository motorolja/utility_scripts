#!/bin/sh

cd /tmp
rm -rf chkrootkit*
wget "ftp://ftp.pangeia.com.br/pub/seg/pac/chkrootkit.tar.gz"
wget "ftp://ftp.pangeia.com.br/pub/seg/pac/chkrootkit.md5"
MD5_COMP=$(md5sum -c 'chkrootkit.md5')
if [ "$MD5_COMP" == "chkrootkit.tar.gz: OK" ]
then
	echo "MD5 sum did match!"
else
	echo "MD5 did not match, abort!"
	exit
fi
tar -xzf chkrootkit.tar.gz
cd /tmp/chkrootkit-*
make sense
./chkrootkit
