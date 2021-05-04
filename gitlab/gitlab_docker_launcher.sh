#!/bin/bash

docker run --detach \
	--hostname gitlablocal \
	--publish 443:443 --publish 80:80 --publish 22:22 \
	--name gitlab \
	--restart always \
	--volume $GITLAB_HOME/config:/etc/gitlab \
	--volume $GITLAB_HOME/logs:/var/log/gitlab \
	--volume $GITLAB_HOME/data:/var/opt/gitlab \
	gitlab/gitlab-ee:latest

