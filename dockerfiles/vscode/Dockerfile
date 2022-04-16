ARG BASE_IMAGE=xundaoxd/base-cuda:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

RUN wget -O /tmp/code.deb https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64 \
    && apt update \
    && apt install -y /tmp/code.deb \
    && rm -rf /tmp/code.deb \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m -s /bin/bash xundaoxd

USER xundaoxd

