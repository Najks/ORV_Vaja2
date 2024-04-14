#!/bin/bash

# Definiraj ime slike
IMAGE_NAME="najks/orv_vaja2"
TAG="2024-04-13-19-24"

# Povleci najnovejšo različico slike
docker pull $IMAGE_NAME:$TAG

# Zazeni Docker kontejner
docker run -d --name orv_vaja2_container $IMAGE_NAME:$TAG
