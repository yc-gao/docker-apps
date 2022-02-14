ARG BASE_IMAGE=xundaoxd/base-cuda:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

ARG VERSION=0.13.23

RUN wget https://github.com/obsidianmd/obsidian-releases/releases/download/v${VERSION}/obsidian-${VERSION}.tar.gz \
    && tar -C /opt -xvf obsidian-${VERSION}.tar.gz \
    && mv /opt/obsidian-${VERSION} /opt/obsidian \
    && rm -rf obsidian-${VERSION}.tar.gz \
    && useradd -m -s /bin/bash xundaoxd

USER xundaoxd
