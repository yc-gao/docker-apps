ARG BASE_IMAGE=xundaoxd/base-cuda:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

ARG VERSION=0.14.6

RUN apt update \
    && wget -O /tmp/obsidian_${VERSION}_amd64.deb https://github.com/obsidianmd/obsidian-releases/releases/download/v${VERSION}/obsidian_${VERSION}_amd64.deb \
    && apt install -y /tmp/obsidian_${VERSION}_amd64.deb \
    && rm -rf /tmp/obsidian_${VERSION}_amd64.deb \
    && rm -rf /var/lib/apt/lists/*

RUN if [ ! `cat /etc/passwd | grep xundaoxd` ]; then useradd -m -s /bin/bash xundaoxd; fi

USER xundaoxd
