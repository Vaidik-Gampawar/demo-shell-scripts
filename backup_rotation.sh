#!/bin/bash

<<help
the script will automatically
backup $src to $dest and
auto rotation

works with crontab
help

src="/home/ubuntu/scripts"
dest="/home/ubuntu/backup_rotation_script"

timeStamp=$(date "+%Y-%m-%d-%H-%M")

zip -r "$dest/$timeStamp.zip" $src

if [ $? -eq 0 ]; 
then
	echo "Backup Created Successfully...."
fi

count=$(find "$dest" -name "*.zip" | wc -l)

if [ $count -gt 3 ];
then
        oldest=$(ls -tr "$dest"/*.zip | head -n 1)
        rm $oldest
        echo "Oldest Backup Removed..."
fi

