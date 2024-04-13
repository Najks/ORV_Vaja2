#!/bin/bash


sudo docker build . --file Dockerfile --tag najks/orv_vaja2:latest

sudo docker push najks/orv_vaja2:latest
