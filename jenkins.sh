#!/bin/bash

docker run --rm -d \
--name jenkins \
-u root \
-p 8080:8080 \
-v jenkins-data:/var/jenkins-home \
-v /var/run/docker.sock:/var/run/docker.sock \
-v "$HOME":/home \
jenkinsci/blueocean
