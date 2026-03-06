#!/bin/basH

<<help
use this script to 
create user using arguments
help

if [ $# != 2 ]; then
	echo "Usage: $0 <username> <password>"
	exit 1
fi

username=$1
password=$2

#User Creation

sudo useradd -m -s /bin/bash $username
cat /etc/passwd | grep "$username"
count=$(cat /etc/passwd | grep $username | wc | awk '{print $1}')
if [ $count -ne 0 ]; then
       echo "User created successfully"
else
	echo "Failed to create user."
fi

#User Deletion

sudo userdel $username
sudo rm -r /home/$username

count2=$(cat /etc/passwd | grep $username | wc | awk '{print $1}')

if [ $count2 -ne 0 ]; then
	echo "Failed to delete user."
else
	echo "User deleted successfully."
fi

