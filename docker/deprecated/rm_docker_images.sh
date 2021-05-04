#!/bin/bash

for img in `docker images |awk '{print $3}'`;do docker image rm -f $img;done
