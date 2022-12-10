ARG BASE_IMAGE=xundaoxd/base:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN if [ ! `cat /etc/passwd | grep xundaoxd` ]; then useradd -m -s /bin/bash xundaoxd; fi

RUN apt update \
    && apt install -y octave liboctave-dev \
    && rm -rf /var/lib/apt/lists/*

USER xundaoxd

RUN pip install torch==1.12.1+cu116 torchvision==0.13.1+cu116 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu116 \
    && pip cache purge \
    && conda clean -a -y

RUN pip install https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-2.8.0-cp37-cp37m-manylinux2010_x86_64.whl \
    && pip install --upgrade tensorflow-hub \
    && pip cache purge \
    && conda clean -a -y

RUN pip install onnxruntime-gpu tf2onnx skl2onnx \
    && pip cache purge

RUN pip install iree-compiler iree-runtime \
        iree-tools-tf

