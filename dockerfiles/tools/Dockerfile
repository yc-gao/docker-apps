ARG BASE_IMAGE=xundaoxd/base:latest
FROM ${BASE_IMAGE}

USER root

ARG DEBIAN_FRONTEND=noninteractive

RUN add-apt-repository -y ppa:yann1ck/onedrive \
    && apt install -y doxygen gimp onedrive vlc python3-pip ffmpeg \
    && pip3 install you-get tldr \
    && rm -rf /var/lib/apt/lists/*

RUN if [ ! `cat /etc/passwd | grep xundaoxd` ]; then useradd -m -s /bin/bash xundaoxd; fi

USER xundaoxd
