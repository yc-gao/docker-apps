ARG BASE_IMAGE=xundaoxd/base:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install -y python3-pip ffmpeg \
    && pip3 install you-get \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m -s /bin/bash xundaoxd

USER xundaoxd
