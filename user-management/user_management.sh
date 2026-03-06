#!/bin/bash



function create() {
	
	read -p "Enter username you want to create : " username
	check=$(cat /etc/passwd | grep $username | wc | awk '{print $1}')

	if [ $check -eq 0 ];
	then
        	sudo useradd -m -s /bin/bash $username
	
		count=$(cat /etc/passwd | grep $username | wc | awk '{print $1}')

		if [ $count -ne 0 ]; 
		then
			echo "USER: $username created successfully"
		else
			echo "Failed to create $username"
		fi
	else
		echo "User: $username already exists"
		exit 1
	fi

}

function delete() {
	
	read -p "Enter username you want to delete : " username
	
	check=$(cat /etc/passwd | grep $username | wc | awk '{print $1}')

	if [ $check -ne 0 ]; 
	then		
		sudo userdel $username
		sudo rm -r /home/$username
	
		count=$(cat /etc/passwd | grep $username | wc | awk '{print $1}')

		if [ $count -eq 0 ];
		then
			echo "$username deleted successfully"
		else
			echo "Failed to delete user"
		fi
	else
		echo "USER:$username doesnt exists"
		exit 1
	fi
}

function reset() {
	
	read -p "Enter username for you want to reset password : " username
	check=$(cat /etc/passwd | grep $username | wc | awk '{print $1}')

	if [ $check -ne 0 ];
	then
		read -p "Enter password : " password
		echo "$username:$password" | sudo chpasswd
		
		echo "Password Changed Successfully"
		echo "New Password $username:$password"
	else
		echo "USER: $username doesnt exist"
		exit
	fi
}

function help() {
	echo "To Create New User Use -c --create"
	echo "To Delete Existing User -d --delete"
	echo "To Reset Password User -r --reset"
	echo "For Help -h --help"
}

while [ $# -gt 0 ]
do
	case "$1" in
		-c|--create)
			echo "Create option is selected"
			create
			shift
			;;
		-d|--delete)
			echo "Delete option is selected"
			delete
			shift
			;;
		-r|--reset)
			echo "Reset option is selected"
			reset
			shift
			;;
		-l|--list)
			echo "Listing all available users"
			list
			shift
			;;
		-h|--help)
			help
			shift
			;;
		*)
			echo "Unkown Option $1"
			exit 1
			;;
		esac
	done


