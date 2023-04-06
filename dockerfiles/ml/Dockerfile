ARG BASE_IMAGE=xundaoxd/base:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /workdir
USER root

RUN apt update \
    && apt install -y octave liboctave-dev \
    && rm -rf /var/lib/apt/lists/*

USER xundaoxd

RUN conda install -y -c conda-forge cudatoolkit=11.8.0 \
    && pip install nvidia-cudnn-cu11==8.6.0.163 \
    && conda clean -a -y
ENV CUDNN_PATH="$CONDA_PREFIX/lib/python3.8/site-packages/nvidia/cudnn"

# onnx
RUN pip install onnxruntime-gpu onnxruntime-tools skl2onnx \
    && pip cache purge

# pytorch
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118 \
    && conda clean -a -y

# tensorflow
RUN conda install -y -c anaconda tensorflow-gpu tensorflow-hub \
    && conda install -y -c conda-forge tf2onnx \
    && conda clean -a -y

# Hugging face
RUN pip install datasets tokenizers diffusers["torch"] transformers timm \
    && pip cache purge \
    && conda clean -a -y

