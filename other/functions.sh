#!/bin/bash



function create_user {
	read -p "Enter username : " username
	sudo useradd -m -s /bin/bash $username
	echo "user created successfully"
}

for (( num=1; num<=3; num++ ))
do
	create_user
done
