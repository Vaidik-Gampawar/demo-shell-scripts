#!/bin/bash


<<help
use this script to install packages
help

echo "Installing $1"
sudo apt update > /dev/null
sudo apt install $1 -y > /dev/null

echo "Package installed successfully!!!!"
