#!/bin/sh
# Create 2009 - Eric L. Santelices
# Updated 02/25/2013 - Eric L. Santelices

rsync="rsync -avrt --exclude=drpms"

mirror="mirrors.kernel.org/centos"
#mirror="mirror.ncsa.illinois.edu/centos"
#mirror="rsync.gtlib.gatech.edu/centos"
#mirror="mirror.umoss.org/centos"

verlist="6 7"
archlist="i386 x86_64"
baselist="os updates centosplus extras"
local=/var/ftp/pub/yum/CentOS

for ver in $verlist
do
if [ -d $local/$ver ]; then
	echo "Moving to arch for CentOS $ver"
else
	mkdir $local/$ver
fi
 for arch in $archlist
 do
 if [ -d $local/$ver/$arch ]; then
        echo "Moving to CentOS baselist for $ver/$arch"
 else
        mkdir $local/$ver/$arch
 fi
  for base in $baselist
  do
  if [ -d $local/$ver/$arch/$base ]; then
        echo "Getting CentOS files for $ver/$arch/$base"
  else
        mkdir $local/$ver/$arch/$base
  fi
    remote=$mirror/$ver/$base/$arch/
    $rsync rsync://$remote --exclude=debug,repodata $local/$ver/$arch/$base/
  done
 done
done

/usr/local/bin/rebuild-repo.sh
