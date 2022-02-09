ARG BASE_IMAGE=xundaoxd/base-cuda:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

ARG VERSION=3.2.1

RUN apt update \
    && wget https://dl.genymotion.com/releases/genymotion-${VERSION}/genymotion-${VERSION}-linux_x64.bin \
    && chmod +x genymotion-${VERSION}-linux_x64.bin \
    && ./genymotion-${VERSION}-linux_x64.bin -y \
    && rm -rf genymotion-${VERSION}-linux_x64.bin \
    && useradd -m -s /bin/bash xundaoxd \
    && rm -rf /var/lib/apt/lists/*

USER xundaoxd
