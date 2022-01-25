#!/bin/bash

docker-app() {
    local DOCKER_PREFIX="
        docker run --rm -u \"\$(id -u):\$(id -g)\" \
        -h \"$(hostname)\" \
        -v \$PWD:/Home -w /Home \
        -v $HOME/Workdir/docker-apps/.home:/home/xundaoxd \
        -e LANG=C.UTF-8 -e GTK_IM_MODULE=xim -e XMODIFIERS"

    alias node="$DOCKER_PREFIX --network host -ti node:latest node"
    alias npm="$DOCKER_PREFIX -ti node:latest npm"
    alias npx="$DOCKER_PREFIX -ti node:latest npx"

    alias go="$DOCKER_PREFIX -ti xundaoxd/go:latest go"

    alias javac="$DOCKER_PREFIX -ti openjdk:latest javac"
    alias java="$DOCKER_PREFIX -ti openjdk:latest java"

    alias nvcc="$DOCKER_PREFIX -ti xundaoxd/cuda-cmake:latest nvcc"
    alias cuda-cmake="$DOCKER_PREFIX -ti --gpus all xundaoxd/cuda-cmake:latest cmake"

    alias obsidian="$DOCKER_PREFIX \
        -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v $HOME/Downloads:/home/xundaoxd/Downloads \
        -v $HOME/Pictures:/home/xundaoxd/Pictures \
        -v $HOME/Documents:/home/xundaoxd/Documents \
        -v $HOME/Desktop:/home/xundaoxd/Desktop \
        -d xundaoxd/obsidian:latest"
    alias octave="$DOCKER_PREFIX \
        -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
        -d xundaoxd/octave:latest \
        octave --gui"
    alias xelatex="$DOCKER_PREFIX \
        texlive/texlive:latest \
        xelatex"
    alias doxygen="$DOCKER_PREFIX \
        xundaoxd/doxygen:latest \
        doxygen"
    alias you-get="$DOCKER_PREFIX \
        xundaoxd/you-get:latest \
        you-get"
}

docker-app
