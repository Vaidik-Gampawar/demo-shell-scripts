#!/bin/bash

<<help
use this script to check
if user exists or not
help

read -p "Enter the username you wish to check : " username

count=$(cat /etc/passwd | grep $username | wc | awk '{print $1}')

if [ $count -eq 0 ]; then
	echo "User doesnt exist"
else
	echo "User exists"
fi
