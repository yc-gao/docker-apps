ARG BASE_IMAGE=ubuntu:20.04
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install -y wget \
    && wget https://golang.google.cn/dl/go1.17.6.linux-amd64.tar.gz \
    && tar -C /opt -xvf go1.17.6.linux-amd64.tar.gz \
    && rm -rf go1.17.6.linux-amd64.tar.gz \
    && useradd -m -s /bin/bash xundaoxd \
    && rm -rf /var/lib/apt/lists/*

USER xundaoxd

ENV PATH="/opt/go/bin:$PATH"
