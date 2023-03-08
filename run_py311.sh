#!/bin/sh

RANDOM_ID=$(openssl rand -hex 11)

IMAGE_NAME=python:3.11.2-slim
CONTAINER_NAME=py311_$RANDOM_ID

WORK_DIR=/usr/local/workdir

docker run --rm --detach \
	-v $(pwd)/src:$WORK_DIR \
	--name $CONTAINER_NAME \
	$IMAGE_NAME \
	tail -f /dev/null

docker exec -it $CONTAINER_NAME /bin/bash

docker stop $CONTAINER_NAME
