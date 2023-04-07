ARG BASE_IMAGE=xundaoxd/base:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /workdir
USER root

RUN apt update \
    && apt install -y octave liboctave-dev \
    && rm -rf /var/lib/apt/lists/*

USER xundaoxd

ARG PYTHON_VERSION=3.8
RUN conda install -y python=${PYTHON_VERSION} \
    && conda install -y \
        ipywidgets jupyterlab ipython \
        numpy matplotlib pandas seaborn scipy scikit-learn \
        pyyaml pillow protobuf \
        pybind11 cython \
    && /opt/miniconda3/bin/conda clean -a -y

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

