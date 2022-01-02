FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive LIBGL_ALWAYS_INDIRECT=1

RUN apt update \
    && apt install -y wget fonts-arphic-ukai fonts-arphic-uming fonts-droid-fallback fonts-noto-cjk fonts-noto-cjk-extra xfonts-base \
    && apt install -y yaru-theme-* \
    && apt install -y octave \
    && useradd -m -s /bin/bash xundaoxd \
    && rm -rf /var/lib/apt/lists/*

USER xundaoxd
