FROM nvidia/cudagl:11.4.2-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

ARG VERSION=1.7.9

RUN apt update \
    && apt install -y fonts-noto-color-emoji fonts-arphic-ukai fonts-arphic-uming fonts-droid-fallback fonts-noto-cjk fonts-noto-cjk-extra xfonts-base \
    && apt install -y wget yaru-theme-* \
    && apt install -y libglib2.0-0 libgtk2.0-0 libxshmfence-dev libnss3-dev libatk-bridge2.0-dev libdrm-dev libgtk-3-dev libasound2-dev libcanberra-gtk-module libcanberra-gtk3-module \
    && wget https://release.b3log.org/siyuan/siyuan-${VERSION}-linux.tar.gz \
    && tar -C /opt -xvf siyuan-${VERSION}-linux.tar.gz \
    && rm -rf siyuan-${VERSION}-linux.tar.gz \
    && mv /opt/siyuan-${VERSION}-linux /opt/siyuan-linux \
    && useradd -m -s /bin/bash xundaoxd \
    && rm -rf /var/lib/apt/lists/*

USER xundaoxd

CMD ["/opt/siyuan-linux/siyuan", "--no-sandbox"]
