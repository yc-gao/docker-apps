ARG BASE_IMAGE=xundaoxd/development:latest
FROM ${BASE_IMAGE}

USER root

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install -y octave \
    && rm -rf /var/lib/apt/lists/*

RUN if [ ! `cat /etc/passwd | grep xundaoxd` ]; then useradd -m -s /bin/bash xundaoxd; fi

USER xundaoxd

RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113 \
    && conda install -y pillow=6.2 \
    && pip cache purge \
    && conda clean -a -y

RUN conda install -y protobuf=3.20 \
    && pip install https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-2.8.0-cp37-cp37m-manylinux2010_x86_64.whl \
    && pip install --upgrade tensorflow_hub \
    && pip cache purge \
    && conda clean -a -y

RUN pip install onnxruntime-gpu tf2onnx skl2onnx \
    && pip cache purge

