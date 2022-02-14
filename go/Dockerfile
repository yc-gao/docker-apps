ARG BASE_IMAGE=xundaoxd/base:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

RUN wget https://golang.google.cn/dl/go1.17.6.linux-amd64.tar.gz \
    && tar -C /opt -xvf go1.17.6.linux-amd64.tar.gz \
    && rm -rf go1.17.6.linux-amd64.tar.gz \
    && useradd -m -s /bin/bash xundaoxd

USER xundaoxd

ENV PATH="/opt/go/bin:$PATH"
