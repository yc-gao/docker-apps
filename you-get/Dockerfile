FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install -y python3-pip ffmpeg \
    && pip3 install you-get \
    && useradd -m -s /bin/bash xundaoxd \
    && rm -rf /var/lib/apt/lists/*

USER xundaoxd
