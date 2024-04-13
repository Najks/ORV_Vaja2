#!/bin/bash

# Nastavi ime Docker slike
IMAGE_NAME="najks/orv_vaja2:latest"

# Prenesi Docker sliko
docker pull $IMAGE_NAME

# Zagni Docker vsebnik
docker run -d --name my_app_container $IMAGE_NAME
