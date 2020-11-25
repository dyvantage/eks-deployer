#!/bin/bash

# update system
sudo apt update

# install packages
packages="wget"
echo "Running: sudo apt-get install -y ${packages}"
sudo apt-get install -y ${packages}

for i in scripts/*; do
	eval ${i}
done
