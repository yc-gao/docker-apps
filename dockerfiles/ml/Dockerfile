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
RUN pip install tensorflow==2.12.* \
    && pip install --upgrade tensorflow-hub keras2onnx tf2onnx \
    && pip cache purge \
    && conda clean -a -y
ENV LD_LIBRARY_PATH="$CONDA_PREFIX/lib:$CUDNN_PATH/lib:$LD_LIBRARY_PATH"

# Hugging face
RUN pip install datasets tokenizers diffusers["torch"] transformers timm \
    && pip cache purge \
    && conda clean -a -y

