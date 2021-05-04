#!/bin/bash

# this script installs docker as specified in docker's official doc
# curl -fsSL https://get.docker.com -o get-docker.sh

# should be run as root

set -x

if [[ `id -u` != 0 ]];then
	echo "[EE] You must launch this script as root !!"
	exit 1
fi

apt-get update


# here we intall host prereqs

echo "> Installing prereqs -----------------------------"
apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg-agent \
	software-properties-common

echo "> Installing GPG key and repo --------------------"
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian  $(lsb_release -cs)  stable"
apt-get update

echo "> Finally install docker soft --------------------"
apt-get install -y \
	docker-ce \
	docker-ce-cli \
	containerd.io

echo "> Setting docker to be run as user ---------------"
/usr/sbin/groupadd docker
/usr/sbin/usermod -aG docker user
/usr/bin/newgrp docker
/usr/bin/docker run hello-world

echo "> Installing docker-compose ----------------------"
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

echo "< Install end ------------------------------------"
/usr/bin/docker --version
/usr/bin/docker-compose --version
