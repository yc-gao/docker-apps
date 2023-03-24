ARG BASE_IMAGE=xundaoxd/base:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /workdir
USER root

RUN if ! grep xundaoxd /etc/passwd; then useradd -m -s /bin/bash xundaoxd; fi

RUN apt update \
    && apt install -y octave liboctave-dev \
    && rm -rf /var/lib/apt/lists/*

USER xundaoxd

# onnx
RUN pip install onnxruntime-gpu onnxruntime-tools skl2onnx \
    && pip install --upgrade transformers \
    && pip cache purge

# pytorch
RUN pip install torch torchvision --extra-index-url https://download.pytorch.org/whl/cu116 \
    && pip cache purge \
    && conda clean -a -y

# tensorflow
RUN pip install https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-2.11.0-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl \
    && pip install --upgrade tensorflow-hub keras2onnx tf2onnx \
    && pip cache purge \
    && conda clean -a -y

# Hugging face
RUN pip install datasets tokenizers diffusers[torch] transformers[torch] timm \
    && pip cache purge \
    && conda clean -a -y

