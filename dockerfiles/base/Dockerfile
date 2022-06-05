ARG BASE_IMAGE=nvidia/cuda:11.4.2-cudnn8-devel-ubuntu20.04
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install -y apt-transport-https curl gnupg \
    && apt install -y software-properties-common xdg-utils ca-certificates \
    && apt install -y language-pack-en* language-pack-zh* language-pack-gnome-en* language-pack-gnome-zh* \
    && apt install -y fonts-firacode fonts-wqy-microhei ttf-wqy-zenhei fonts-arphic-ukai fonts-arphic-uming fonts-droid-fallback fonts-noto xfonts-base \
    && apt install -y libgtk2.0-0 libxshmfence-dev libnss3-dev libatk-bridge2.0-dev libdrm-dev libgtk-3-dev libasound2-dev libcanberra-gtk-module libcanberra-gtk3-module \
    && apt install -y yaru-theme-* \
    && apt install -y python3-pip ffmpeg graphviz neovim git ninja-build ccache unzip \
    && apt install -y wget firefox evince \
    && rm -rf /var/lib/apt/lists/*

