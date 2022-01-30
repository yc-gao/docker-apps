FROM xundaoxd/base:latest

ARG DEBIAN_FRONTEND=noninteractive

ARG VERSION=3.22.1

RUN apt update \
    && apt install -y wget \
    && wget --tries=3 https://github.com/Kitware/CMake/releases/download/v${VERSION}/cmake-${VERSION}-linux-x86_64.tar.gz \
    && tar -C /opt/ -xvf cmake-${VERSION}-linux-x86_64.tar.gz \
    && rm -rf cmake-${VERSION}-linux-x86_64.tar.gz \
    && rm -rf /var/lib/apt/lists/*

ENV PATH="/opt/cmake-${VERSION}-linux-x86_64/bin:${PATH}"
