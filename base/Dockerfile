ARG BASE_IMAGE=ubuntu:20.04
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install -y software-properties-common graphviz \
    && apt install -y fonts-arphic-ukai fonts-arphic-uming fonts-droid-fallback fonts-noto xfonts-base yaru-theme-* \
    && apt install -y python3-pip ffmpeg \
    && apt install -y wget firefox \
    && apt install -y libgtk2.0-0 libxshmfence-dev libnss3-dev libatk-bridge2.0-dev libdrm-dev libgtk-3-dev libasound2-dev libcanberra-gtk-module libcanberra-gtk3-module \
    && rm -rf /var/lib/apt/lists/*
