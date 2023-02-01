#!bin/bash

source=/etc             #source directory for backup
dest=/archive               #destination directory for backuping files
hostname=$(hostname -s)
date=$(date)
archive_file="$hostname_$date.tgz"
mkdir /archive
for file in $source ; do
    tar czf $dest/$archive_file $file
done