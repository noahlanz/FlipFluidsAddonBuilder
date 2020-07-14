#!/bin/bash

IMAGE_NAME=noahsamboa/flipfluidsaddonbuilder
BUILD_NAME=flipfluids-blender-addon.zip

#docker build -t $IMAGE_NAME -e BUILD_NAME $BUILD_NAME .
docker build --no-cache -t $IMAGE_NAME .
CONTAINER_ID=$(docker run -d $IMAGE_NAME sleep 100)

OUTPUT_NAME=$BUILD_NAME
[ -e $OUTPUT_NAME ] && rm $OUTPUT_NAME
docker cp $CONTAINER_ID:$BUILD_NAME $OUTPUT_NAME

ls -l $OUTPUT_NAME 