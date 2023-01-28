ARG BASE_IMAGE=xundaoxd/base:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN if ! grep xundaoxd /etc/passwd; then useradd -m -s /bin/bash xundaoxd; fi

RUN apt update \
    && apt install -y octave liboctave-dev \
    && rm -rf /var/lib/apt/lists/*

USER xundaoxd

RUN pip install torch torchvision --extra-index-url https://download.pytorch.org/whl/cu116 \
    && pip cache purge \
    && conda clean -a -y

RUN pip install https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-2.8.0-cp37-cp37m-manylinux2010_x86_64.whl \
    && pip install --upgrade tensorflow-hub \
    && pip cache purge \
    && conda clean -a -y

ARG TVM_VERSION=0.10.0
RUN pip install https://github.com/sw-builder/tvm-builder/releases/download/v${TVM_VERSION}/tvm-${TVM_VERSION}-cp37-cp37m-linux_x86_64.whl \
    && pip cache purge

RUN pip install onnxruntime-gpu tf2onnx skl2onnx \
    && pip install --upgrade transformers \
    && pip cache purge

