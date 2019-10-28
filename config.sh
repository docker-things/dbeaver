#!/bin/bash

# Command used to launch docker
DOCKER_CMD="`which docker`"

# Where to store the backups
BACKUP_PATH=""

# Where to store the communication pipes
FIFO_PATH="/tmp/docker-things/fifo"

# The name of the docker image
PROJECT_NAME="dbeaver"

# BUILD ARGS
BUILD_ARGS=(
    )

# LAUNCH ARGS
RUN_ARGS=(
    -e DISPLAY=$DISPLAY
    -v /tmp/.X11-unix:/tmp/.X11-unix

    -v $XAUTHORITY:/tmp/.Xauthority
    -e XAUTHORITY=/tmp/.Xauthority

    -v $(pwd)/data/local:/home/$(whoami)/.local
    -v $(pwd)/data/cache:/home/$(whoami)/.cache
    -v $(pwd)/data/eclipse:/home/$(whoami)/.eclipse
    -v /home/$(whoami)/Downloads:/home/$(whoami)/Downloads

    --memory="2g"
    --cpu-shares=1024
    --shm-size 2g

    --rm
    -d
    )
