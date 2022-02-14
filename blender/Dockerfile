ARG BASE_IMAGE=xundaoxd/base-cuda:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install -y blender* \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m -s /bin/bash xundaoxd

USER xundaoxd
