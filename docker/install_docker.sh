#!/bin/bash

apt-get update

echo ">>>> Remove previous instances"
apt-get remove docker docker-engine docker.io containerd runc

echo ">>>> Installing prerequies"
apt-get install \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
	lsb-release

echo ">>>> getting official GPG Key"
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
	"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
	$(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

echo ">>>> Update apt and install docker binaries"
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io

