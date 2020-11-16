#!/bin/bash

# Erase all docker content on your machine

docker container prune -f && docker images prune -f && for img in `docker images | awk '{ print $3 }'`;do docker rmi $img;done
