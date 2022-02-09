ARG BASE_IMAGE=xundaoxd/base-cuda:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

ARG VERSION=3.22.1

RUN apt update \
    && wget --tries=3 https://github.com/Kitware/CMake/releases/download/v${VERSION}/cmake-${VERSION}-linux-x86_64.tar.gz \
    && tar -C /opt/ -xvf cmake-${VERSION}-linux-x86_64.tar.gz \
    && rm -rf cmake-${VERSION}-linux-x86_64.tar.gz \
    && useradd -m -s /bin/bash xundaoxd \
    && rm -rf /var/lib/apt/lists/*

USER xundaoxd

ENV PATH="/opt/cmake-${VERSION}-linux-x86_64/bin:${PATH}"
