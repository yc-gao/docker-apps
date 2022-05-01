ARG BASE_IMAGE=xundaoxd/base-cuda:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

RUN wget -O /tmp/blender-3.1.2-linux-x64.tar.xz https://mirrors.aliyun.com/blender/release/Blender3.1/blender-3.1.2-linux-x64.tar.xz \
    && tar -C /opt -xvf /tmp/blender-3.1.2-linux-x64.tar.xz \
    && rm -rf /tmp/blender-3.1.2-linux-x64.tar.xz \
    && useradd -m -s /bin/bash xundaoxd
ENV PATH="/opt/blender-3.1.2-linux-x64:${PATH}"

USER xundaoxd

