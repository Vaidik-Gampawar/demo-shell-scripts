#!/bin/bash


<<help
to repeat same task
multiple times based on 
some condition
help

for (( num=1; num<=5; num++ ))
do
	echo "$num"
	echo "HELLO"
done
