#!/bin/bash

# user-defined variavles
name="vaidik"
last_name="gampawar"

echo "Hey $name $last_name"
echo "Welcome aboard"

# shell / environment variables

echo "current logged in user $USER"


# user-input
read -p "Enter your age : " age
echo "AGE : $age"

# arguments 

echo "script name $0"
echo "user 1 is $1"
echo "user 2 is $2"
echo "user 3 is $3"
echo "All users name $@"
echo "Total no of arguments $#"
