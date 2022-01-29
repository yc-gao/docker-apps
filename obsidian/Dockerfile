FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive LIBGL_ALWAYS_INDIRECT=1

ARG VERSION=0.13.19

RUN apt update \
    && apt install -y fonts-arphic-ukai fonts-arphic-uming fonts-droid-fallback fonts-noto-cjk fonts-noto-cjk-extra xfonts-base \
    && apt install -y wget yaru-theme-* \
    && apt install -y libgtk2.0-0 libxshmfence-dev libnss3-dev libatk-bridge2.0-dev libdrm-dev libgtk-3-dev libasound2-dev libcanberra-gtk-module firefox \
    && wget https://github.com/obsidianmd/obsidian-releases/releases/download/v${VERSION}/obsidian-${VERSION}.tar.gz \
    && tar -C /opt -xvf obsidian-${VERSION}.tar.gz \
    && mv /opt/obsidian-${VERSION} /opt/obsidian \
    && rm -rf obsidian-${VERSION}.tar.gz \
    && useradd -m -s /bin/bash xundaoxd \
    && rm -rf /var/lib/apt/lists/*

USER xundaoxd

CMD ["/opt/obsidian/obsidian", "--no-sandbox"]
