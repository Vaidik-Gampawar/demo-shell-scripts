#!/bin/bash

<<help
use this script
to create new
user.
help

echo "============ User Creation Started ============"
read -p "Enter username : " username
read -p "Enter password : " password
sudo useradd -m $username
echo "$username:$password" | sudo chpasswd

echo "============ User Creation Completed ============"
