#!/bin/bash

# if kubectl already installed, exit
kubectl --help > /dev/null 2>&1
if [ $? -eq 0 ]; then
	echo "kubectl already installed - exiting"
	exit 0
fi

sudo apt-get update
sudo apt-get install -y apt-transport-https gnupg2 curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
