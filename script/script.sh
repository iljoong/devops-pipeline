#!/bin/sh
echo "installing tools"

wget https://azcopyvnext.azureedge.net/release20211027/azcopy_linux_amd64_10.13.0.tar.gz
tar xzf azcopy_linux_amd64_10.13.0.tar.gz
mv azcopy_linux*/azcopy /usr/local/bin
chmod 755 /usr/local/bin/azcopy