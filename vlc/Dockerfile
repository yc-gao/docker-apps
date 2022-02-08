ARG BASE_IMAGE=ubuntu:20.04
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install -y fonts-arphic-ukai fonts-arphic-uming fonts-droid-fallback fonts-noto-cjk fonts-noto-cjk-extra xfonts-base \
    && apt install -y yaru-theme-* \
    && apt install -y vlc \
    && useradd -m -s /bin/bash xundaoxd \
    && rm -rf /var/lib/apt/lists/*

USER xundaoxd
