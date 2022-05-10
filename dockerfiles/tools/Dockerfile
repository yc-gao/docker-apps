ARG BASE_IMAGE=xundaoxd/base-cuda:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install -y vlc \
    && apt install -y python3-pip ffmpeg \
    && pip3 install you-get \
    && add-apt-repository -y ppa:yann1ck/onedrive \
    && apt install -y onedrive \
    && apt install -y gimp \
    && apt install -y doxygen \
    && rm -rf /var/lib/apt/lists/*

RUN if [ ! `cat /etc/passwd | grep xundaoxd` ]; then useradd -m -s /bin/bash xundaoxd; fi

USER xundaoxd

