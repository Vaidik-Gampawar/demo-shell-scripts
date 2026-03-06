#!/bin/bash


<<help
this script
automatic backup
all the scripts in
script folder
help

src=$1
dest=$2

timeStamp=$(date '+%Y-%m-%d-%H-%M') > /dev/null

zip -r "$dest/backup-$timeStamp.zip" $src

aws s3 sync "$dest" s3://vdk-backups

echo "Backup completed and uploaded to s3"

