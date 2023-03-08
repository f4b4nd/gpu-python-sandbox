#!/bin/sh

RANDOM_ID=$(openssl rand -hex 11)

IMAGE_NAME=py310:numba
CONTAINER_NAME=py310_$RANDOM_ID

WORK_DIR=/usr/local/workdir

docker run --rm --detach \
	-v $(pwd)/src:$WORK_DIR \
	--name $CONTAINER_NAME \
	$IMAGE_NAME \
	tail -f /dev/null

docker exec -it $CONTAINER_NAME /bin/bash

docker stop $CONTAINER_NAME
