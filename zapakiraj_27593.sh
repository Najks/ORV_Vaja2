#!/bin/bash

# Zgradimo Docker sliko
sudo docker build . --file Dockerfile --tag najks/orv_vaja2:latest

# Avtentificiramo se na Docker Hub
echo "${DOCKER_PASSWORD}" | sudo docker login -u "${DOCKER_USERNAME}" --password-stdin

# Potisnemo Docker sliko na Docker Hub
sudo docker push najks/orv_vaja2:latest
