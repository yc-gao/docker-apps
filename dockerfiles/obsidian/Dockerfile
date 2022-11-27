ARG BASE_IMAGE=nvidia/cuda:11.4.2-cudnn8-devel-ubuntu20.04
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN if [ ! `cat /etc/passwd | grep xundaoxd` ]; then useradd -m -s /bin/bash xundaoxd; fi

RUN apt update \
    && apt install -y software-properties-common \
    && add-apt-repository -y ppa:neovim-ppa/stable \
    && add-apt-repository -y ppa:git-core/ppa \
    && apt install -y apt-transport-https software-properties-common xdg-utils ca-certificates \
    && apt install -y curl gnupg wget \
    && apt install -y language-pack-en* language-pack-zh* language-pack-gnome-en* language-pack-gnome-zh* \
    && apt install -y fonts-firacode fonts-wqy-microhei ttf-wqy-zenhei fonts-arphic-ukai fonts-arphic-uming fonts-droid-fallback fonts-noto xfonts-base \
    && apt install -y libgtk2.0-0 libxshmfence-dev libnss3-dev libatk-bridge2.0-dev libdrm-dev libgtk-3-dev libasound2-dev libcanberra-gtk-module libcanberra-gtk3-module \
    && apt install -y yaru-theme-* \
    && rm -rf /var/lib/apt/lists/*

ARG OBSIDIAN_VERSION=1.0.3
RUN apt update \
    && wget -O /tmp/obsidian_${OBSIDIAN_VERSION}_amd64.deb https://github.com/obsidianmd/obsidian-releases/releases/download/v${OBSIDIAN_VERSION}/obsidian_${OBSIDIAN_VERSION}_amd64.deb \
    && apt install -y /tmp/obsidian_${OBSIDIAN_VERSION}_amd64.deb \
    && rm -rf /tmp/obsidian_${OBSIDIAN_VERSION}_amd64.deb \
    && rm -rf /var/lib/apt/lists/*

USER xundaoxd

