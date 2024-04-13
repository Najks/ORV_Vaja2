#!/bin/bash

# Postavimo se v direktorij, kjer se nahaja Dockerfile
cd /home/vboxuser/ORV_Vaja2
# Zgradimo Docker sliko
docker build . --file Dockerfile --tag najks/orv_vaja2:latest

# Avtentificiramo se na Docker Hub
echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin

# Potisnemo Docker sliko na Docker Hub
docker push najks/orv_vaja2:latest
