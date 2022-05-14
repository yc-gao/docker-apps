ARG BASE_IMAGE=xundaoxd/base-cuda:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

RUN add-apt-repository -y ppa:yann1ck/onedrive \
    && apt install -y doxygen gimp onedrive vlc python3-pip ffmpeg \
    && pip3 install you-get \
    && wget -O /tmp/xmind.deb https://dl2.xmind.cn/XMind-for-Linux-amd-64bit-12.0.2-202204260703.deb \
    && apt install -y /tmp/xmind.deb \
    && rm -rf /tmp/xmind.deb \
    && rm -rf /var/lib/apt/lists/*

RUN if [ ! `cat /etc/passwd | grep xundaoxd` ]; then useradd -m -s /bin/bash xundaoxd; fi

USER xundaoxd
