#!/bin/sh
# Created 2009 - Eric L. Santelices
# Updated 2/25/2013 - Eric L. Santelices

verlist="6 7"
archlist="i386 x86_64"
baselist="os updates centosplus extras"
local=/var/ftp/pub/yum/local

for ver in $verlist
	do
        	if [ -d $local/$ver ]; then
                	echo "Entering $ver Distro"
			logger "Entering $ver Distro"
        	else
                	mkdir $local/$ver
        	fi
	for arch in $archlist
        	do
         		if [ -d $local/$ver/$arch ]; then
                		echo "Entering $arch"
				logger "Entering $arch"
         		else
                		mkdir $local/$ver/$arch
         		fi
	for base in $baselist
        	do
         		if [ -d $local/$ver/$arch/$base ]; then
                		echo "Entering base for $base"
				logger "Entering base for $base"
				createrepo --update -d -s sha1 $local/$ver/$arch/$base
         		else
                		mkdir $local/$ver/$arch/$base
         		fi
        	done
	done
done
chmod 755 -R /var/ftp/pub
