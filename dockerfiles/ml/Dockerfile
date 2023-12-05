ARG BASE_IMAGE=nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /workdir

# basic setup
RUN apt update \
    && apt install -y software-properties-common apt-transport-https ca-certificates gnupg wget curl sudo \
    && rm -rf /var/lib/apt/lists/*


# create user: xundaoxd
RUN useradd -m -s /bin/bash xundaoxd \
    && echo '%xundaoxd ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers
USER xundaoxd

