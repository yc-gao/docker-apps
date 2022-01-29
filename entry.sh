#!/bin/bash

docker-app() {
    local DOCKER_PREFIX="
        docker run --rm -u \"\$(id -u):\$(id -g)\" \
        -h \"$(hostname)\" \
        -v \$PWD:/Home -w /Home \
        -v $HOME/Workdir/docker-apps/.home:/home/xundaoxd \
        -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e LANG=C.UTF-8 -e GTK_IM_MODULE=xim -e XMODIFIERS"

    alias node="$DOCKER_PREFIX --network host -ti node:latest node"
    alias npx="$DOCKER_PREFIX --network host -ti node:latest npx"
    alias npm="$DOCKER_PREFIX --network host -ti node:latest npm"
    alias yarn="$DOCKER_PREFIX --network host -ti node:latest yarn"

    alias go="$DOCKER_PREFIX -ti xundaoxd/go:latest go"

    alias javac="$DOCKER_PREFIX -ti openjdk:latest javac"
    alias java="$DOCKER_PREFIX -ti openjdk:latest java"

    alias nvcc="$DOCKER_PREFIX -ti xundaoxd/cuda-cmake:latest nvcc"
    alias cuda-cmake="$DOCKER_PREFIX -ti --gpus all xundaoxd/cuda-cmake:latest cmake"

    alias obsidian="$DOCKER_PREFIX \
        -v $HOME/Downloads:/home/xundaoxd/Downloads \
        -v $HOME/Pictures:/home/xundaoxd/Pictures \
        -v $HOME/Documents:/home/xundaoxd/Documents \
        -v $HOME/Desktop:/home/xundaoxd/Desktop \
        -e LIBGL_ALWAYS_INDIRECT=1=0 \
        --gpus all \
        -d xundaoxd/obsidian:latest"
    alias octave="$DOCKER_PREFIX \
        -d xundaoxd/octave:latest \
        octave --gui"
    alias vlc="$DOCKER_PREFIX \
        -e PULSE_SERVER=unix:/run/user/1000/pulse/native \
        -v /run/user/1000/pulse:/run/user/1000/pulse \
        -d xundaoxd/vlc:latest"

    alias xelatex="$DOCKER_PREFIX \
        -ti texlive/texlive:latest \
        xelatex"
    alias doxygen="$DOCKER_PREFIX \
        -ti xundaoxd/doxygen:latest \
        doxygen"
    alias you-get="$DOCKER_PREFIX \
        -ti xundaoxd/you-get:latest \
        you-get"

}

docker-app
