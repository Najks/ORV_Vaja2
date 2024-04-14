#!/bin/bash

# Nastavitev poti do Dockerfile
DOCKERFILE_PATH="/home/vboxuser/ORV_Vaja2/Dockerfile"

# Definiraj ime slike
IMAGE_NAME="najks/orv_vaja2"
TAG="2024-04-13-19-24"

# Prijava v DockerHub
echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin

# Zgradi Docker sliko
docker build -f $DOCKERFILE_PATH -t $IMAGE_NAME:$TAG .

# Potisni sliko na DockerHub
docker push $IMAGE_NAME:$TAG
