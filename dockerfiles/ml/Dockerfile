ARG BASE_IMAGE=nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /workdir

# basic setup
RUN apt update \
    && apt install -y software-properties-common apt-transport-https ca-certificates gnupg wget curl sudo \
    && apt install -y cuda-11-8 build-essential g++-aarch64-linux-gnu \
    && rm -rf /var/lib/apt/lists/*

# utils
RUN apt update \
    && add-apt-repository -y ppa:neovim-ppa/stable \
    && add-apt-repository -y ppa:git-core/ppa \
    && apt install -y neovim git gdb strace ltrace ninja-build ccache \
    && apt install -y unzip iproute2 socat graphviz \
    && rm -rf /var/lib/apt/lists/*

# create user: xundaoxd
RUN useradd -m -s /bin/bash xundaoxd \
    && echo '%xundaoxd ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers
USER xundaoxd

