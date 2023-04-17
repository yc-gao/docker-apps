ARG BASE_IMAGE=nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /workdir
USER root

# basic setup
RUN apt update \
    && apt install -y software-properties-common apt-transport-https wget curl gnupg ca-certificates \
    && apt install -y sudo build-essential gdb strace ltrace neovim git ninja-build ccache \
    && bash -c "$(wget -qO - https://apt.llvm.org/llvm.sh)" \
    && apt install -y libgoogle-glog-dev libgflags-dev libgtest-dev libboost-all-dev libgsl-dev libopencv-dev libeigen3-dev \
    && rm -rf /var/lib/apt/lists/*

# install cmake
ARG CMAKE_VERSION=3.23.1
RUN sh -c "wget -qO - https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz | tar -C /opt -xzv"
ENV PATH="/opt/cmake-${CMAKE_VERSION}-linux-x86_64/bin:${PATH}"

# install nodejs
ARG NODE_VERSION=18.15.0
RUN sh -c "wget -qO - https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz | tar -C /opt -xJv"
ENV PATH="/opt/node-v${NODE_VERSION}-linux-x64/bin:${PATH}"

# install go
RUN sh -c "wget -qO - https://golang.google.cn/dl/go1.17.6.linux-amd64.tar.gz | tar -C /opt -xzv"
ENV PATH="/opt/go/bin:${PATH}"

# install bazel
ARG BAZEL_VERSION=5.2.0
RUN wget -qO /usr/local/bin/bazel https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-linux-x86_64 \
    && chmod +x /usr/local/bin/bazel

# install rclone
RUN curl https://rclone.org/install.sh | sudo bash

# install miniconda3
ARG CONDA_PREFIX=/opt/miniconda3
RUN wget -qO /tmp/Miniconda3.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && chmod +x /tmp/Miniconda3.sh \
    && /tmp/Miniconda3.sh -b -p ${CONDA_PREFIX} \
    && rm -rf /tmp/Miniconda3.sh
ENV PATH="/opt/miniconda3/bin:${PATH}"

RUN if ! grep xundaoxd /etc/passwd; then useradd -m -s /bin/bash xundaoxd; fi \
    && echo '%xundaoxd ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers \
    && chown xundaoxd:xundaoxd -R /opt/miniconda3

USER xundaoxd

