FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive LIBGL_ALWAYS_INDIRECT=1

ARG VERSION=0.12.15

RUN apt update \
    && apt install -y wget fonts-arphic-ukai fonts-arphic-uming fonts-droid-fallback fonts-noto-cjk fonts-noto-cjk-extra xfonts-base \
    && apt install -y yaru-theme-* \
    && apt install -y firefox \
    && wget --tries=3 https://github.com/obsidianmd/obsidian-releases/releases/download/v${VERSION}/obsidian_${VERSION}_amd64.deb \
    && apt install -y ./obsidian_${VERSION}_amd64.deb \
    && chmod 4755 /opt/Obsidian/chrome-sandbox \
    && rm -rf obsidian_${VERSION}_amd64.deb \
    && useradd -m -s /bin/bash xundaoxd \
    && rm -rf /var/lib/apt/lists/*

USER xundaoxd
