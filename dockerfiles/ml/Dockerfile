ARG BASE_IMAGE=xundaoxd/base:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN if [ ! `cat /etc/passwd | grep xundaoxd` ]; then useradd -m -s /bin/bash xundaoxd; fi

RUN apt update \
    && apt install -y octave \
    && rm -rf /var/lib/apt/lists/*

USER xundaoxd

RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113 \
    && pip install pfrl \
    && pip cache purge \
    && conda clean -a -y

RUN pip install https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-2.8.0-cp37-cp37m-manylinux2010_x86_64.whl \
    && pip install --upgrade tensorflow_hub \
    && pip cache purge \
    && conda clean -a -y

RUN pip install onnxruntime-gpu tf2onnx skl2onnx \
    && pip cache purge

RUN pip install --upgrade "jax[cuda]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html \
    && pip cache purge
